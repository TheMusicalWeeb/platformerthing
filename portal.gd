extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var portal_open = false
var gem_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	gem_count = len(get_tree().get_nodes_in_group("Gems"))
	PlayerStats.gem_count = gem_count
	$AnimationPlayer.play("locked")
	
func _process(delta):
	

	if PlayerStats.gem_count <= 0 and portal_open == false:
		$AnimationPlayer.play("Open")
		portal_open = true
		yield($AnimationPlayer,"animation_finished")
		$AnimationPlayer.play("Portal")

#	if gems is less than or equal zero AND portal open is false
#		play the open portal animation
#		set portal open to true
#		wait for portal animation to finish (yield)
#		play the spinning portal animation
	



func _on_Portal_body_entered(body):
	if PlayerStats.gem_count<= 0 and portal_open:
		body.queue_free()	
		$AnimationPlayer.play("close")
		yield($AnimationPlayer,"animation_finished")
		get_tree().change_scene_to(load("res://Level2.tscn"))
#	if the player enters the portal
#		delete the player
#		play the portal close animation
#		yield util animation finishes
#		load next level
