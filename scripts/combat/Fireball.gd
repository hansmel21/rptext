extends Area2D

const SPEED        := 200.0
const MAX_DISTANCE := 300.0

var direction: Vector2 = Vector2.RIGHT
var damage:    int     = 30

var _traveled: float = 0.0

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	area_entered.connect(_on_area_entered)

func _physics_process(delta: float) -> void:
	var step := direction * SPEED * delta
	position    += step
	_traveled   += step.length()
	if _traveled >= MAX_DISTANCE:
		queue_free()

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		return
	if body.has_method("take_damage"):
		body.take_damage(damage)
	AudioManager.play_sfx("fireball_hit")
	queue_free()

func _on_area_entered(area: Area2D) -> void:
	# Walls flagged as "wall" group block fireballs
	if area.is_in_group("wall"):
		AudioManager.play_sfx("fireball_hit")
		queue_free()
