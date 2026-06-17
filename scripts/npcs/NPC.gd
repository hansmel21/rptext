extends Area2D

# Base NPC. Override _on_dialogue_finished() in subclasses for quest logic.

@export var npc_name:       String         = "Villager"
@export var dialogue_lines: Array[String]  = ["..."]
@export var quest_index:    int            = -1   # -1 = no quest tied to this NPC

var _talking: bool = false

signal interaction_finished

func interact() -> void:
	if _talking or DialogueManager.is_active():
		return
	_talking = true
	DialogueManager.show_dialogue(npc_name, dialogue_lines, _on_dialogue_finished)

func _on_dialogue_finished() -> void:
	_talking = false
	interaction_finished.emit()
	if quest_index >= 0 and QuestManager.is_active(quest_index):
		_check_quest_completion()

func _check_quest_completion() -> void:
	# Subclasses override this to define when their quest completes.
	pass
