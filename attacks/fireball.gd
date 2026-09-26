extends Node2D

var speed : float = 400

var velocity : Vector2 = Vector2.ZERO

func _ready() -> void:
	velocity = Vector2(speed*cos(rotation),speed*sin(rotation))

func _physics_process(delta: float) -> void:
	velocity = Vector2(speed*cos(rotation),speed*sin(rotation))
	position += velocity * delta

func _on_hitbox_body_entered(_body: Node2D) -> void:
	queue_free()
