extends KinematicBody2D


var velocity = Vector2.ZERO

const FRINCTION = 500
const ACCELERATIOM = 500
const MAX_SPEED = 100 

onready var animationPlayer = $AnimationPlayer

 
func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left") 
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up") 
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		if input_vector.x > 0:
			animationPlayer.play("RunRight")
		elif input_vector.x < 0:
			animationPlayer.play("RunLeft")
		elif input_vector.y < 0:
			animationPlayer.play("RunUp")
		elif input_vector.y > 0:
			animationPlayer.play("RunDown")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATIOM * delta)
	else:
		animationPlayer.play("IdleRight")
		velocity = velocity.move_toward(Vector2.ZERO, FRINCTION * delta)
	
	velocity = move_and_slide(velocity)
