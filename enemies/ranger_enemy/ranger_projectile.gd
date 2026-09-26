extends Node2D


var player : CharacterBody2D

var speed = 100.0
var velocity : Vector2 = Vector2.ZERO


func _ready() -> void:
	if player:
		look_at(player.position)
		velocity = Vector2(speed*cos(rotation), speed*sin(rotation))


func _physics_process(delta: float) -> void:
	if player:
		position += velocity * delta
