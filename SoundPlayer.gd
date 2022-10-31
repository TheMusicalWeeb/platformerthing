extends Node

onready var music = AudioStreamPlayer.new()

var music_tracks = {
	"level1":"res://SFX/LevelOne.ogg",
	"title":"res://SFX/Title.ogg",
}


var sound_effects = {
	"jump":"res://SFX/jump.wav",
	"hurt":"res://SFX/hitHurt.wav",
	"pickup":"res://SFX/pickupCoin.wav",
	"enemyhit":"res://SFX/explosion.wav",
	
}

var music_db = 1
var sound_db = 1

func change_music_db(val):
	music_db = linear2db(val)
	
func change_sound_db(val):
	sound_db = linear2db(val)
func play_music(track):
	music.stream = load(music_tracks[track])
	music.play()
	
func _ready():
	print("start")
	music.stream = load(music_tracks["title"])
	add_child(music)
	music.play()
	print(music.stream)
	print("playing song")
	
	
	

func play_sound_effect(sfx):
	var sound = AudioStreamPlayer.new()
	sound.stream = load(sound_effects[sfx])
	add_child(sound)
	sound.play()
	yield(sound,"finished")
	sound.queue_free()
