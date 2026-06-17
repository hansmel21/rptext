extends Node

enum Command { FOLLOW, STAY, SCOUT, RECALL, ATTACK }

var current_command: Command = Command.FOLLOW
var _pet: Node = null

signal command_changed(command: Command)

func register_pet(pet_node: Node) -> void:
	_pet = pet_node

func unregister_pet() -> void:
	_pet = null

func issue_command(command: Command) -> void:
	current_command = command
	command_changed.emit(command)
	if _pet and _pet.has_method("receive_command"):
		_pet.receive_command(command)

func get_command_name(command: Command) -> String:
	match command:
		Command.FOLLOW:  return "Follow"
		Command.STAY:    return "Stay"
		Command.SCOUT:   return "Scout"
		Command.RECALL:  return "Recall"
		Command.ATTACK:  return "Attack"
	return ""
