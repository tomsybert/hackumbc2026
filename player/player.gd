extends CharacterBody2D

var maxSpeed : float = 250.0
var acceleration : float = 3000.0

func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	input_vector = Input.get_vector("game_left","game_right","game_up","game_down")
	velocity = velocity.move_toward(input_vector * maxSpeed, acceleration * delta)
	move_and_slide()
	
