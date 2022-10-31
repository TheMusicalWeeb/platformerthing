extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func fadeout():
	$AnimationPlayer.play("FadeOut")
	yield($AnimationPlayer,"animation_finished")

func start_game():
	get_tree().change_scene("res://Level1.tscn")
	
func _on_START_pressed():
	fadeout()
	#get_tree().change_scene("res://Level1.tscn")
	


func _on_QUIT_pressed():
	get_tree().quit()
