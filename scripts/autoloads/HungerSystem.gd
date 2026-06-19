extends Node

# Inactive until the isolated area activates it.

const MAX_HUNGER := 100.0
const DRAIN_PER_SECOND := 2.0 / 60.0   # 2 units per minute
const HP_DRAIN_INTERVAL := 5.0          # 1 HP lost every 5 seconds at 0 hunger

const FOOD_RESTORE := {
	"berry":    15.0,
	"mushroom": 15.0,
	"fruit":    20.0,
	"plant":    20.0,
	"animal":   35.0,
	"fish":     40.0,
}

var hunger: float = MAX_HUNGER
var active: bool = false

var _hp_drain_timer: float = 0.0

signal hunger_changed(current: float, maximum: float)

func activate() -> void:
	hunger = MAX_HUNGER
	active = true
	hunger_changed.emit(hunger, MAX_HUNGER)

func deactivate() -> void:
	active = false

func _process(delta: float) -> void:
	if not active:
		return

	hunger = maxf(hunger - DRAIN_PER_SECOND * delta, 0.0)
	hunger_changed.emit(hunger, MAX_HUNGER)

	if hunger == 0.0:
		_hp_drain_timer += delta
		if _hp_drain_timer >= HP_DRAIN_INTERVAL:
			_hp_drain_timer -= HP_DRAIN_INTERVAL
			var player: CharacterBody2D = GameManager.get_player()
			if player and player.has_method("take_damage"):
				player.take_damage(1)

func eat(food_type: String) -> void:
	var restore: float = FOOD_RESTORE.get(food_type, 10.0)
	hunger = minf(hunger + restore, MAX_HUNGER)
	_hp_drain_timer = 0.0
	hunger_changed.emit(hunger, MAX_HUNGER)
	AudioManager.play_sfx("item_pickup")
