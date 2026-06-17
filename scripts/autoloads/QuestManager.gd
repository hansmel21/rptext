extends Node

enum QuestState { LOCKED, ACTIVE, COMPLETE }

const TOTAL_QUESTS := 9

# Quest names indexed 0–8
const QUEST_NAMES := [
	"First Light",
	"Father's Trade",
	"Morning Training",
	"Herb Gathering",
	"Beast Care",
	"Fire Within",
	"Meet the Chief",
	"A Helping Hand",
	"The Hunt"
]

var quest_states: Array = []

signal quest_started(index: int)
signal quest_completed(index: int)
signal invasion_triggered

func _ready() -> void:
	_reset()

func _reset() -> void:
	quest_states.clear()
	for i in TOTAL_QUESTS:
		quest_states.append(QuestState.LOCKED)
	quest_states[0] = QuestState.ACTIVE

func start_quest(index: int) -> void:
	if index < 0 or index >= TOTAL_QUESTS:
		return
	if quest_states[index] != QuestState.LOCKED:
		return
	quest_states[index] = QuestState.ACTIVE
	quest_started.emit(index)

func complete_quest(index: int) -> void:
	if index < 0 or index >= TOTAL_QUESTS:
		return
	if quest_states[index] == QuestState.COMPLETE:
		return
	quest_states[index] = QuestState.COMPLETE
	quest_completed.emit(index)

	var player := GameManager.get_player()
	var pos := player.global_position if player else Vector2.ZERO
	GameManager.save_checkpoint(index, pos)

	_unlock_next(index)

	if index == TOTAL_QUESTS - 1:
		invasion_triggered.emit()

func _unlock_next(completed: int) -> void:
	var next := completed + 1
	if next < TOTAL_QUESTS:
		start_quest(next)

func is_active(index: int) -> bool:
	return index >= 0 and index < TOTAL_QUESTS and quest_states[index] == QuestState.ACTIVE

func is_complete(index: int) -> bool:
	return index >= 0 and index < TOTAL_QUESTS and quest_states[index] == QuestState.COMPLETE

func load_from_checkpoint(last_completed: int) -> void:
	_reset()
	for i in last_completed + 1:
		quest_states[i] = QuestState.COMPLETE
	var next := last_completed + 1
	if next < TOTAL_QUESTS:
		quest_states[next] = QuestState.ACTIVE
