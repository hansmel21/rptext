extends Node2D

@onready var player: CharacterBody2D = $YSort/Player
@onready var hud: CanvasLayer        = $HUD

func _ready() -> void:
	hud.connect_player(player)
	AudioManager.play_music(AudioManager.Track.VILLAGE)
