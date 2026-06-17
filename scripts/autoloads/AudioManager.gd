extends Node

enum Track { VILLAGE, INVASION, ISOLATED_AREA, TAMING, NONE }

# Paths filled in when audio assets are ready
const MUSIC_PATHS := {
	Track.VILLAGE: "res://assets/audio/music/village.ogg",
	Track.INVASION: "res://assets/audio/music/invasion.ogg",
	Track.ISOLATED_AREA: "res://assets/audio/music/isolated.ogg",
	Track.TAMING: "res://assets/audio/music/taming.ogg",
}

const SFX_PATHS := {
	"footstep":       "res://assets/audio/sfx/footstep.wav",
	"sword_swing":    "res://assets/audio/sfx/sword_swing.wav",
	"sword_hit":      "res://assets/audio/sfx/sword_hit.wav",
	"fireball_cast":  "res://assets/audio/sfx/fireball_cast.wav",
	"fireball_hit":   "res://assets/audio/sfx/fireball_hit.wav",
	"player_hurt":    "res://assets/audio/sfx/player_hurt.wav",
	"player_death":   "res://assets/audio/sfx/player_death.wav",
	"item_pickup":    "res://assets/audio/sfx/item_pickup.wav",
	"quest_complete": "res://assets/audio/sfx/quest_complete.wav",
	"dialogue_blip":  "res://assets/audio/sfx/dialogue_blip.wav",
	"taming_hit":     "res://assets/audio/sfx/taming_hit.wav",
	"taming_miss":    "res://assets/audio/sfx/taming_miss.wav",
	"bridge_rumble":  "res://assets/audio/sfx/bridge_rumble.wav",
	"fader_attack":   "res://assets/audio/sfx/fader_attack.wav",
	"fader_hit":      "res://assets/audio/sfx/fader_hit.wav",
	"no_mana":        "res://assets/audio/sfx/no_mana.wav",
}

var _music: AudioStreamPlayer
var _sfx: AudioStreamPlayer
var _current_track: Track = Track.NONE

func _ready() -> void:
	_music = AudioStreamPlayer.new()
	_music.bus = "Music"
	add_child(_music)

	_sfx = AudioStreamPlayer.new()
	_sfx.bus = "SFX"
	add_child(_sfx)

func play_music(track: Track) -> void:
	if track == _current_track:
		return
	_current_track = track
	if not MUSIC_PATHS.has(track):
		return
	if not ResourceLoader.exists(MUSIC_PATHS[track]):
		return
	_music.stream = load(MUSIC_PATHS[track])
	_music.play()

func transition_music(track: Track) -> void:
	var tween := create_tween()
	tween.tween_property(_music, "volume_db", -60.0, 0.5)
	await tween.finished
	play_music(track)
	tween = create_tween()
	tween.tween_property(_music, "volume_db", 0.0, 0.5)

func stop_music() -> void:
	_music.stop()
	_current_track = Track.NONE

func play_sfx(key: String) -> void:
	if not SFX_PATHS.has(key):
		return
	if not ResourceLoader.exists(SFX_PATHS[key]):
		return
	_sfx.stream = load(SFX_PATHS[key])
	_sfx.play()
