extends Area2D

@export var npc_name:         String = "Villager"
@export var dialogue_resource: DialogueResource
@export var dialogue_title:   String = "start"
@export var quest_index:      int    = -1

var _talking: bool = false

signal interaction_finished

func interact() -> void:
	if _talking or dialogue_resource == null:
		return
	_talking = true
	var player := GameManager.get_player()
	if player and player.has_method("lock_movement"):
		player.lock_movement()
	await DialogueManager.show_dialogue_balloon(dialogue_resource, dialogue_title)
	_on_dialogue_finished()

func _on_dialogue_finished() -> void:
	_talking = false
	var player := GameManager.get_player()
	if player and player.has_method("unlock_movement"):
		player.unlock_movement()
	interaction_finished.emit()
	if quest_index >= 0 and QuestManager.is_active(quest_index):
		_check_quest_completion()

func _check_quest_completion() -> void:
	pass
