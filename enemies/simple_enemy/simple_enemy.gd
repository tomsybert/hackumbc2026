extends CharacterBody2D

@export var player : CharacterBody2D

var speed = 10000.0


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if player:
		velocity = position.direction_to(player.position) * speed * delta
	
	move_and_slide()
