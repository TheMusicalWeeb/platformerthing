extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var dir = Vector2(1,0)
var speed = 100

enum state {FLY, DEAD}


func update_animation(anim): 
	if dir.x < 0:
		$Sprite.flip_h = true
	elif dir.x > 0:
		$Sprite.flip_h = false
		
	match(anim):
		state.FLY:
			$AnimationPlayer.play("fly")

# Called when the node enters the scene tree for the first time.
func _process(delta):
	translate(dir * speed * delta)




# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
#dir.x = -dir.x


func _on_Area2D_area_entered(area):
	dir.x = -dir.x
