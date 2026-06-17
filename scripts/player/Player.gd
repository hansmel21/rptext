extends CharacterBody2D

const SPEED              := 80.0
const SWORD_DAMAGE       := 20
const FIREBALL_DAMAGE    := 30
const FIREBALL_COST      := 15.0
const MANA_REGEN         := 5.0    # per second
const I_FRAMES           := 0.5    # invincibility seconds after hit
const SWORD_OFFSET       := 14.0   # px from center to hitbox
const SWORD_ACTIVE_TIME  := 0.15   # seconds hitbox is live

@export var max_hp: int   = 100
@export var max_mana: float = 60.0

var hp:   int
var mana: float
var facing: Vector2 = Vector2.DOWN

var _can_move:     bool = true
var _invincible:   bool = false
var _sword_active: bool = false

@onready var sword_hitbox:     Area2D          = $SwordHitbox
@onready var interaction_zone: Area2D          = $InteractionZone
@onready var sprite:           AnimatedSprite2D = $AnimatedSprite2D
@onready var camera:           Camera2D        = $Camera2D

signal hp_changed(current: int,   maximum: int)
signal mana_changed(current: float, maximum: float)
signal died

func _ready() -> void:
	add_to_group("player")
	hp   = max_hp
	mana = max_mana
	sword_hitbox.monitoring = false
	sword_hitbox.body_entered.connect(_on_sword_hit)

func _physics_process(delta: float) -> void:
	if _can_move:
		_move()
	else:
		velocity = Vector2.ZERO
	move_and_slide()
	_regen_mana(delta)

func _unhandled_input(event: InputEvent) -> void:
	if not _can_move:
		return
	if event.is_action_pressed("attack_melee") and not _sword_active:
		_swing_sword()
	elif event.is_action_pressed("attack_fireball"):
		_cast_fireball()
	elif event.is_action_pressed("interact"):
		_try_interact()

# ── Movement ──────────────────────────────────────────────────────────────────

func _move() -> void:
	var dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if dir != Vector2.ZERO:
		facing  = dir.normalized()
		velocity = dir.normalized() * SPEED
		_update_animation(dir)
	else:
		velocity = Vector2.ZERO
		sprite.stop()

func _update_animation(dir: Vector2) -> void:
	if abs(dir.x) > abs(dir.y):
		sprite.play("walk_side")
		sprite.flip_h = dir.x < 0
	elif dir.y < 0:
		sprite.play("walk_up")
	else:
		sprite.play("walk_down")

# ── Mana ──────────────────────────────────────────────────────────────────────

func _regen_mana(delta: float) -> void:
	if mana >= max_mana:
		return
	mana = minf(mana + MANA_REGEN * delta, max_mana)
	mana_changed.emit(mana, max_mana)

# ── Sword ─────────────────────────────────────────────────────────────────────

func _swing_sword() -> void:
	_sword_active = true
	sword_hitbox.position = facing * SWORD_OFFSET
	sword_hitbox.monitoring = true
	AudioManager.play_sfx("sword_swing")
	sprite.play("attack")
	await get_tree().create_timer(SWORD_ACTIVE_TIME).timeout
	sword_hitbox.monitoring = false
	_sword_active = false

func _on_sword_hit(body: Node2D) -> void:
	if body.has_method("take_damage"):
		body.take_damage(SWORD_DAMAGE)
		AudioManager.play_sfx("sword_hit")

# ── Fireball ──────────────────────────────────────────────────────────────────

func _cast_fireball() -> void:
	if mana < FIREBALL_COST:
		AudioManager.play_sfx("no_mana")
		return
	mana -= FIREBALL_COST
	mana_changed.emit(mana, max_mana)
	AudioManager.play_sfx("fireball_cast")

	var fb_scene: PackedScene = load("res://scenes/combat/Fireball.tscn")
	var fb := fb_scene.instantiate()
	get_parent().add_child(fb)
	fb.global_position = global_position
	fb.damage    = FIREBALL_DAMAGE
	fb.direction = (get_global_mouse_position() - global_position).normalized()

# ── Interact ──────────────────────────────────────────────────────────────────

func _try_interact() -> void:
	for area in interaction_zone.get_overlapping_areas():
		if area.has_method("interact"):
			area.interact()
			return

# ── Damage / Death ────────────────────────────────────────────────────────────

func take_damage(amount: int) -> void:
	if _invincible:
		return
	hp = maxi(hp - amount, 0)
	hp_changed.emit(hp, max_hp)
	AudioManager.play_sfx("player_hurt")
	if hp == 0:
		_die()
	else:
		_start_invincibility()

func heal(amount: int) -> void:
	hp = mini(hp + amount, max_hp)
	hp_changed.emit(hp, max_hp)

func _start_invincibility() -> void:
	_invincible = true
	await get_tree().create_timer(I_FRAMES).timeout
	_invincible = false

func _die() -> void:
	died.emit()
	AudioManager.play_sfx("player_death")
	GameManager.restart_from_checkpoint()

# ── Movement lock (used by dialogue / cutscenes) ──────────────────────────────

func lock_movement() -> void:
	_can_move = false
	velocity   = Vector2.ZERO

func unlock_movement() -> void:
	_can_move = true
