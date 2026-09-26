extends CharacterBody2D

@export var player : CharacterBody2D

var health = 5.0
var speed = 10000.0
var radius_distance = 500.0


func _ready() -> void:
	pass


func _process(delta: float) -> void:
	if player:
		if position.distance_to(player.position) < radius_distance:
			pass
		else:
			velocity = position.direction_to(player.position) * speed * delta
			move_and_slide()
