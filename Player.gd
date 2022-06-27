extends KinematicBody2D

export (int) var speed = 120
export (int) var jump_speed = -180
export (int) var gravity = 400
export (int) var slide_speed = 400

var velocity = Vector2.ZERO

export (float) var friction = 10
export (float) var acceleration = 25

enum state {IDLE, JUMP, RUN, CROUCH, HURT, CLIMBUP,CLIMBDOWN, FALL, STARTJUMP}

onready var player_state = state.IDLE

var on_ladder = false
export (int)  var ladder_speed = 20

func _ready():
	$AnimationPlayer.play("idle")
	pass

func update_animation(anim): 
	if velocity.x < 0:
		$Sprite.flip_h = true
	elif velocity.x > 0:
		$Sprite.flip_h = false
		
	match(anim):
		state.CROUCH:
			$AnimationPlayer.play("crouch")
		state.HURT:
			$AnimationPlayer.play("hurt")
		state.RUN: 
			$AnimationPlayer.play("run")
		state.IDLE:
			$AnimationPlayer.play("idle")
		state.CLIMBUP:
			$AnimationPlayer.play("climb")
		state.JUMP:
			$AnimationPlayer.play("jump")
		state.FALL:
			$AnimationPlayer.play("fall")
	
func handle_state(player_state,delta):
	#velocity.y += gravity * delta
	match(player_state):
		state.STARTJUMP:
			velocity.y = jump_speed
		state.CROUCH:
			pass
		state.CLIMBUP:
			velocity.y = ladder_speed
#		state.RUN:
#			velocity = move_and_slide(velocity, Vector2.UP)
#		state.FALL:
#			velocity = move_and_slide(velocity, Vector2.UP)
#		state.JUMP:
#			velocity = move_and_slide(velocity, Vector2.UP)			

func get_input(): 
	var dir= Input.get_action_strength("right") - Input.get_action_strength("left")
	if dir !=0:
		velocity.x = move_toward(velocity.x, dir*speed, acceleration)
	else: 
		velocity.x = move_toward(velocity.x, 0, friction)
	
func _physics_process(delta):
	get_input()
	if velocity.x == 0 and not on_ladder:
		player_state = state.IDLE
		print("idle")
	if Input.is_action_just_pressed("jump") and is_on_floor():
		player_state = state.STARTJUMP
		print("startjump")
	elif Input.is_action_pressed("crouch") and is_on_floor():
		player_state = state.CROUCH
		print("crouch")
	elif velocity.x != 0:
		player_state = state.RUN
		print("run")
	
	if on_ladder and Input.is_action_pressed("jump"):
		player_state = state.CLIMBUP
	
		
	if not is_on_floor() and not on_ladder:
		if velocity.y < 0:
			player_state = state.JUMP
		if velocity.y >= 0: 
			player_state = state.FALL
	
	handle_state(player_state,delta)
	update_animation(player_state)
	#set gravity
	velocity.y += gravity * delta
	if player_state != state.CROUCH:
		velocity = move_and_slide(velocity, Vector2.UP)


func _on_DeathZone_area_entered(area):
	if area.is_in_group("Deadly"):
		var death = load("res://Death.tscn").instance()
		get_parent().add_child(death)
		death.global_position = global_position
		hide()
		set_process(false)
		set_physics_process(false)


func _on_LadderChecker_area_entered(area):
	if area.is_in_group("Ladder"):
		on_ladder = true # Replace with function body.


func _on_LadderChecker_area_exited(area):
	pass # Replace with function body.
