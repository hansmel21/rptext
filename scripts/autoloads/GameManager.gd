extends Node

enum GameState {
	MAIN_MENU,
	BUILD_SELECTION,
	VILLAGE_PHASE,
	INVASION_CUTSCENE,
	ESCAPE_PHASE,
	ISOLATED_AREA,
	CH2_TRANSITION
}

enum BuildType { MAGE, WARRIOR, WEAKLING }

const SAVE_PATH := "user://save.json"
const FADE_DURATION := 0.5

var current_state: GameState = GameState.MAIN_MENU
var player_build: BuildType = BuildType.MAGE
var checkpoint_quest_index: int = 0
var checkpoint_position: Vector2 = Vector2.ZERO

signal state_changed(new_state: GameState)

func change_state(new_state: GameState) -> void:
	current_state = new_state
	state_changed.emit(new_state)
	match new_state:
		GameState.BUILD_SELECTION:
			_transition_to("res://scenes/menus/BuildSelection.tscn")
		GameState.VILLAGE_PHASE:
			_transition_to("res://scenes/village/VillageMap.tscn")
		GameState.ISOLATED_AREA:
			_transition_to("res://scenes/village/IsolatedArea.tscn")

func _transition_to(path: String) -> void:
	var overlay := ColorRect.new()
	overlay.color = Color(0, 0, 0, 0)
	overlay.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
	overlay.mouse_filter = Control.MOUSE_FILTER_IGNORE
	add_child(overlay)

	var tween := create_tween()
	tween.tween_property(overlay, "color:a", 1.0, FADE_DURATION)
	await tween.finished

	get_tree().change_scene_to_file(path)
	await get_tree().process_frame

	tween = create_tween()
	tween.tween_property(overlay, "color:a", 0.0, FADE_DURATION)
	await tween.finished
	overlay.queue_free()

func get_player() -> CharacterBody2D:
	var players := get_tree().get_nodes_in_group("player")
	return players[0] as CharacterBody2D if players.size() > 0 else null

func save_checkpoint(quest_index: int, pos: Vector2) -> void:
	checkpoint_quest_index = quest_index
	checkpoint_position = pos
	var data := {
		"quest_index": quest_index,
		"pos_x": pos.x,
		"pos_y": pos.y,
		"build": int(player_build)
	}
	var file := FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	if file:
		file.store_string(JSON.stringify(data))
		file.close()

func load_save() -> void:
	if not FileAccess.file_exists(SAVE_PATH):
		return
	var file := FileAccess.open(SAVE_PATH, FileAccess.READ)
	if not file:
		return
	var json := JSON.new()
	if json.parse(file.get_as_text()) != OK:
		file.close()
		return
	file.close()
	var data: Dictionary = json.get_data()
	checkpoint_quest_index = data.get("quest_index", 0)
	checkpoint_position = Vector2(data.get("pos_x", 0.0), data.get("pos_y", 0.0))
	player_build = data.get("build", 0) as BuildType
	QuestManager.load_from_checkpoint(checkpoint_quest_index)

func restart_from_checkpoint() -> void:
	load_save()
	change_state(GameState.VILLAGE_PHASE)
