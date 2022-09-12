extends AudioStreamPlayer2D

func _ready() -> void:
	var audioStream: AudioStream = preload("res://LevelOne.ogg")
	self.set_stream(audioStream)
	self.set_volume_db(-2.0)
	play()



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
