extends CharacterBody2D

# Base class for all three starter pets.
# In Ch.1 the pet does not fight — it follows, stays, scouts, and recalls only.
# Combat AI activates in Ch.2+.

const FOLLOW_DIST  := 20.0
const RECALL_DIST  := 14.0
const FOLLOW_SPEED := 70.0
const SCOUT_SPEED  := 90.0

var _command: PetCommandSystem.Command = PetCommandSystem.Command.FOLLOW
var _player:  CharacterBody2D          = null

func _ready() -> void:
	add_to_group("pet")
	_player = get_tree().get_first_node_in_group("player") as CharacterBody2D
	PetCommandSystem.register_pet(self)
	PetCommandSystem.command_changed.connect(receive_command)

func _exit_tree() -> void:
	PetCommandSystem.unregister_pet()

func _physics_process(_delta: float) -> void:
	match _command:
		PetCommandSystem.Command.FOLLOW:  _follow()
		PetCommandSystem.Command.STAY:    velocity = Vector2.ZERO
		PetCommandSystem.Command.RECALL:  _recall()
		PetCommandSystem.Command.SCOUT:   _scout()
		PetCommandSystem.Command.ATTACK:  _attack_behaviour()
	move_and_slide()

func receive_command(command: PetCommandSystem.Command) -> void:
	_command = command

# ── Movement modes ────────────────────────────────────────────────────────────

func _follow() -> void:
	if not _player:
		return
	var dist := global_position.distance_to(_player.global_position)
	velocity = (_player.global_position - global_position).normalized() * FOLLOW_SPEED \
		if dist > FOLLOW_DIST else Vector2.ZERO

func _recall() -> void:
	if not _player:
		return
	var dist := global_position.distance_to(_player.global_position)
	velocity = (_player.global_position - global_position).normalized() * FOLLOW_SPEED \
		if dist > RECALL_DIST else Vector2.ZERO

func _scout() -> void:
	if not _player:
		return
	# Move toward a point ahead of the player in their facing direction.
	var ahead: Vector2 = _player.global_position
	if _player.get("facing"):
		ahead += _player.facing * 48.0
	var dist := global_position.distance_to(ahead)
	velocity = (ahead - global_position).normalized() * SCOUT_SPEED \
		if dist > 8.0 else Vector2.ZERO

func _attack_behaviour() -> void:
	# No combat in Ch.1 — subclasses override for Ch.2+.
	_follow()
