extends CanvasLayer

# Full-screen dialogue overlay. Persists across scenes as an autoload.
# Usage: DialogueManager.show(speaker, ["line 1", "line 2"], optional_callback)

var _panel: PanelContainer
var _speaker_label: Label
var _text_label: Label
var _prompt_label: Label

var _lines: Array[String] = []
var _index: int = 0
var _callback: Callable = Callable()
var _active: bool = false

signal dialogue_ended

func _ready() -> void:
	layer = 10
	_build_ui()
	visible = false

func _build_ui() -> void:
	_panel = PanelContainer.new()
	_panel.set_anchors_preset(Control.PRESET_BOTTOM_WIDE)
	_panel.offset_top = -56
	_panel.offset_bottom = -4
	_panel.offset_left = 4
	_panel.offset_right = -4
	add_child(_panel)

	var vbox := VBoxContainer.new()
	vbox.add_theme_constant_override("separation", 2)
	_panel.add_child(vbox)

	_speaker_label = Label.new()
	_speaker_label.add_theme_font_size_override("font_size", 8)
	vbox.add_child(_speaker_label)

	_text_label = Label.new()
	_text_label.add_theme_font_size_override("font_size", 7)
	_text_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	_text_label.size_flags_vertical = Control.SIZE_EXPAND_FILL
	vbox.add_child(_text_label)

	_prompt_label = Label.new()
	_prompt_label.text = "[ E ]"
	_prompt_label.add_theme_font_size_override("font_size", 6)
	_prompt_label.horizontal_alignment = HORIZONTAL_ALIGNMENT_RIGHT
	vbox.add_child(_prompt_label)

func show_dialogue(speaker: String, lines: Array[String], callback: Callable = Callable()) -> void:
	_lines = lines
	_index = 0
	_callback = callback
	_active = true
	visible = true
	_speaker_label.text = speaker
	_display_current_line()
	_lock_player()

func _display_current_line() -> void:
	if _index < _lines.size():
		_text_label.text = _lines[_index]
		AudioManager.play_sfx("dialogue_blip")

func _unhandled_input(event: InputEvent) -> void:
	if not _active:
		return
	if event.is_action_pressed("dialogue_advance"):
		_advance()
		get_viewport().set_input_as_handled()

func _advance() -> void:
	_index += 1
	if _index >= _lines.size():
		_close()
	else:
		_display_current_line()

func _close() -> void:
	_active = false
	visible = false
	dialogue_ended.emit()
	_unlock_player()
	if _callback.is_valid():
		_callback.call()

func _lock_player() -> void:
	var p := GameManager.get_player()
	if p and p.has_method("lock_movement"):
		p.lock_movement()

func _unlock_player() -> void:
	var p := GameManager.get_player()
	if p and p.has_method("unlock_movement"):
		p.unlock_movement()

func is_active() -> bool:
	return _active
