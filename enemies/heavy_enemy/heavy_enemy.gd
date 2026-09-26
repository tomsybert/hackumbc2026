extends CharacterBody2D

@export var player : CharacterBody2D

var health = 15.0
var speed = 7500.0


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if player:
		velocity = position.direction_to(player.position) * speed * delta
	
	move_and_slide()
