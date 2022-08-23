extends Node2D

var dir = Vector2(1,0)
var speed = 100

enum state {RUN, DEAD}


func update_animation(): 
	if dir.x > 0:
		$Opossum.flip_h = true
	elif dir.x < 0:
		$Opossum.flip_h = false
	$AnimationPlayer.play("run")

# Called when the node enters the scene tree for the first time.
func _process(delta):
	translate(dir * speed * delta)
	update_animation()




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#dir.x = -dir.x


func _on_Area2D_area_entered(area):
	print(area.name)
	if area.is_in_group("MonsterFlipper"):dir.x = -dir.x


func _on_Opossum_area_entered(area):
	if area.is_in_group("MonsterFlipper"):dir.x = -dir.x
