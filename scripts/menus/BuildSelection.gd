extends Control

# Build selection screen shown before Ch.1 begins.
# Player picks Mage / Warrior / Weakling — determines pet and stat profile.

func _ready() -> void:
	# Ensure no leftover save bleeds in for a new game.
	# (Loading from save skips this screen entirely.)
	pass

func _on_mage_pressed() -> void:
	GameManager.player_build = GameManager.BuildType.MAGE
	GameManager.change_state(GameManager.GameState.VILLAGE_PHASE)

func _on_warrior_pressed() -> void:
	GameManager.player_build = GameManager.BuildType.WARRIOR
	GameManager.change_state(GameManager.GameState.VILLAGE_PHASE)

func _on_weakling_pressed() -> void:
	GameManager.player_build = GameManager.BuildType.WEAKLING
	GameManager.change_state(GameManager.GameState.VILLAGE_PHASE)
