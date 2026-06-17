extends CanvasLayer

# HUD: HP / Mana / Hunger bars, all bottom-center horizontal.
# Mana bar hidden until Quest 6. Hunger bar hidden until isolated area.

@onready var hp_bar:     ProgressBar = $Bars/HPBar
@onready var mana_bar:   ProgressBar = $Bars/ManaBar
@onready var hunger_bar: ProgressBar = $Bars/HungerBar

func _ready() -> void:
	layer = 5
	mana_bar.visible   = false
	hunger_bar.visible = false
	HungerSystem.hunger_changed.connect(_on_hunger_changed)

func connect_player(player: CharacterBody2D) -> void:
	player.hp_changed.connect(_on_hp_changed)
	player.mana_changed.connect(_on_mana_changed)
	_on_hp_changed(player.hp, player.max_hp)

func _on_hp_changed(current: int, maximum: int) -> void:
	hp_bar.max_value = maximum
	hp_bar.value     = current

func _on_mana_changed(current: float, maximum: float) -> void:
	mana_bar.visible   = true
	mana_bar.max_value = maximum
	mana_bar.value     = current

func _on_hunger_changed(current: float, maximum: float) -> void:
	hunger_bar.visible   = true
	hunger_bar.max_value = maximum
	hunger_bar.value     = current
