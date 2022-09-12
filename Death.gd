extends Node2D


func _ready():
	pass

func reset():
	get_tree().reload_current_scene()
	PlayerStats.lives -=1
	

