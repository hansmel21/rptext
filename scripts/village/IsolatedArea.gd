extends Node2D

@onready var player:    CharacterBody2D = $YSort/Player
@onready var hud:       CanvasLayer     = $HUD
@onready var area_exit: Area2D          = $AreaExit

func _ready() -> void:
	hud.connect_player(player)
	HungerSystem.activate()
	AudioManager.play_music(AudioManager.Track.ISOLATED_AREA)
	area_exit.body_entered.connect(_on_area_exit_entered)

func _on_area_exit_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		HungerSystem.deactivate()
		GameManager.change_state(GameManager.GameState.CH2_TRANSITION)
