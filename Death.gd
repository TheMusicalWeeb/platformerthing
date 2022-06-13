extends Node2D


func _ready():
	pass

func reset():
	get_tree().change_scene("res://Level1.tscn")
	PlayerStats.lives -=1
	

