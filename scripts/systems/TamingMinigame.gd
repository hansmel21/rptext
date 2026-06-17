extends CanvasLayer

# Guitar Hero-style rhythm minigame for taming mana beasts.
#
# Ch.1: infinite retries on fail.
# Ch.2+: one shot — failing permanently loses the beast.
#
# Notes are shown one at a time. The player must press the matching
# arrow key during the HIT_WINDOW before the note expires.

const NOTE_DURATION := 1.5    # seconds per note
const HIT_WINDOW    := 0.45   # acceptable input window (last N seconds of duration)
const PASS_RATE     := 0.6    # fraction of notes needed to pass (e.g. 6 / 10)

var _sequence:     Array[String] = []
var _index:        int   = 0
var _note_timer:   float = 0.0
var _in_window:    bool  = false
var _hit_count:    int   = 0
var _active:       bool  = false
var _ch1_mode:     bool  = true    # true = infinite retry

# UI nodes (set in scene)
@onready var arrow_display: Label  = $ArrowDisplay
@onready var progress_bar:  ProgressBar = $ProgressBar

signal taming_success
signal taming_failed

func start(sequence: Array[String], ch1_mode: bool = true) -> void:
	_sequence  = sequence
	_ch1_mode  = ch1_mode
	_index     = 0
	_hit_count = 0
	_note_timer = 0.0
	_in_window  = false
	_active     = true
	visible     = true
	_show_note()
	AudioManager.play_music(AudioManager.Track.TAMING)

func _process(delta: float) -> void:
	if not _active:
		return
	_note_timer += delta
	progress_bar.value = (_note_timer / NOTE_DURATION) * 100.0

	if _note_timer >= NOTE_DURATION - HIT_WINDOW:
		_in_window = true
	if _note_timer >= NOTE_DURATION:
		_note_expired()

func _unhandled_input(event: InputEvent) -> void:
	if not _active or not _in_window:
		return
	var note := _sequence[_index]
	var matched := (
		(note == "up"    and event.is_action_pressed("taming_up"))    or
		(note == "down"  and event.is_action_pressed("taming_down"))  or
		(note == "left"  and event.is_action_pressed("taming_left"))  or
		(note == "right" and event.is_action_pressed("taming_right"))
	)
	if matched:
		AudioManager.play_sfx("taming_hit")
		_hit_count += 1
		_advance()
		get_viewport().set_input_as_handled()

func _note_expired() -> void:
	# Player missed this note.
	AudioManager.play_sfx("taming_miss")
	if not _ch1_mode:
		_fail()
		return
	_advance()   # Ch.1: just move on

func _advance() -> void:
	_note_timer = 0.0
	_in_window  = false
	_index     += 1
	if _index >= _sequence.size():
		_evaluate()
	else:
		_show_note()

func _evaluate() -> void:
	var rate := float(_hit_count) / float(_sequence.size())
	if rate >= PASS_RATE:
		_succeed()
	elif _ch1_mode:
		_restart()   # Ch.1: retry from the beginning
	else:
		_fail()

func _succeed() -> void:
	_active = false
	visible = false
	taming_success.emit()

func _fail() -> void:
	_active = false
	visible = false
	taming_failed.emit()

func _restart() -> void:
	_index     = 0
	_hit_count = 0
	_note_timer = 0.0
	_in_window  = false
	_show_note()

func _show_note() -> void:
	if _index >= _sequence.size():
		return
	var note := _sequence[_index]
	arrow_display.text = match_arrow(note)

static func match_arrow(dir: String) -> String:
	match dir:
		"up":    return "▲"
		"down":  return "▼"
		"left":  return "◀"
		"right": return "▶"
	return "?"

static func generate_sequence(length: int = 10) -> Array[String]:
	var dirs: Array[String] = ["up", "down", "left", "right"]
	var seq: Array[String]  = []
	for i in length:
		seq.append(dirs[randi() % dirs.size()])
	return seq
