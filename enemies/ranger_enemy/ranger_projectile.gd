extends Node2D


@export var player : CharacterBody2D

var speed = 15000.0
var velocity : Vector2 = Vector2.ZERO


func _ready() -> void:
	velocity = Vector2(speed*cos(rotation), speed*sin(rotation))


func _process(delta: float) -> void:
	if player:
		look_at(player.position)
		velocity = velocity.move_toward(player.position, delta) * speed
