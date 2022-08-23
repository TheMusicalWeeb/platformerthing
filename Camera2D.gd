extends Camera2D

func _process(delta):
	var target = get_parent().get_node("Player")
	if target:
		global_position = target.global_position
#var target = null
#var zoomed = false
#var center = Vector2.ZERO
#
#
#func _ready():
#	center = get_viewport_rect().size/2
#
#func _process(delta):
#	if Input.is_action_just_pressed("zoom"):
#		if zoomed:
#			target = center
#			zoomed = false 
#		else: 
#			target = owner.get_node("Player")
#			zoomed = true
#
#	if zoomed: 
#		zoom = zoom.move_toward(Vector2(0.3,0.3), .03)
#		position = position.move_toward(target.global_position,80)
#
#	else: 
#		zoom = zoom.move_toward(Vector2(1,1),0.03)
#		position = position.move_toward(center,80)
