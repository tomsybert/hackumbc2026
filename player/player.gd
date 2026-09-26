extends CharacterBody2D
class_name Player

@onready var manager = $UpgradeManager
@onready var attacker = $Attacker
@export var ui : UI
var maxSpeed : float = 250.0
var acceleration : float = 3000.0
var life : int = 3

func _physics_process(delta: float) -> void:
	var input_vector = Vector2.ZERO
	input_vector = Input.get_vector("game_left","game_right","game_up","game_down")
	velocity = velocity.move_toward(input_vector * maxSpeed, acceleration * delta)
	move_and_slide()
	
