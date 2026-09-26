extends Node2D

var speed : float = 500
var damage : float = 0.1
var velocity : Vector2 = Vector2.ZERO

func _ready() -> void:
	velocity = Vector2(speed*cos(rotation),speed*sin(rotation))

func _physics_process(delta: float) -> void:
	velocity = Vector2(speed*cos(rotation),speed*sin(rotation))
	position += velocity * delta

func _on_hitbox_body_entered(_body: Node2D) -> void:
	queue_free()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("Enemy"):
		area.get_parent().hurt(damage)
	queue_free()


func _on_timer_timeout() -> void:
	queue_free()
