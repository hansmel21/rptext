extends CharacterBody2D

enum State { IDLE, CHASE, ATTACK, DEAD }

const MAX_HP          := 40
const DAMAGE          := 15
const SPEED           := 50.0
const SIGHT_RADIUS    := 5 * 16.0   # 5 tiles
const SIGHT_LEASH     := 8 * 16.0   # gives up chase beyond this
const ATTACK_RANGE    := 14.0       # melee reach
const ATTACK_COOLDOWN := 1.0

var hp:             int   = MAX_HP
var state:          State = State.IDLE
var _attack_timer:  float = 0.0
var _player:        CharacterBody2D = null

func _ready() -> void:
	add_to_group("enemy")
	_player = get_tree().get_first_node_in_group("player") as CharacterBody2D

func _physics_process(delta: float) -> void:
	if state == State.DEAD:
		return
	_attack_timer -= delta
	match state:
		State.IDLE:   _check_sight()
		State.CHASE:  _chase(delta)
		State.ATTACK: _attack()

func _check_sight() -> void:
	if not _player:
		return
	if global_position.distance_to(_player.global_position) <= SIGHT_RADIUS:
		state = State.CHASE

func _chase(_delta: float) -> void:
	if not _player:
		state = State.IDLE
		return
	var dist := global_position.distance_to(_player.global_position)
	if dist > SIGHT_LEASH:
		state = State.IDLE
		velocity = Vector2.ZERO
		move_and_slide()
		return
	if dist <= ATTACK_RANGE:
		state = State.ATTACK
		velocity = Vector2.ZERO
		move_and_slide()
		return
	velocity = (_player.global_position - global_position).normalized() * SPEED
	move_and_slide()

func _attack() -> void:
	if not _player:
		state = State.IDLE
		return
	if global_position.distance_to(_player.global_position) > ATTACK_RANGE:
		state = State.CHASE
		return
	if _attack_timer <= 0.0:
		_player.take_damage(DAMAGE)
		_attack_timer = ATTACK_COOLDOWN
		AudioManager.play_sfx("fader_attack")

func take_damage(amount: int) -> void:
	if state == State.DEAD:
		return
	hp -= amount
	AudioManager.play_sfx("fader_hit")
	if state == State.IDLE:
		state = State.CHASE
	if hp <= 0:
		_die()

func _die() -> void:
	state = State.DEAD
	velocity = Vector2.ZERO
	# TODO: play death animation, then queue_free
	queue_free()
