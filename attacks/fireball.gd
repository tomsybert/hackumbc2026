extends Node2D

var speed : float = 500
var damage : float = 0.1
var velocity : Vector2 = Vector2.ZERO
var poison_time : float = 0
var freeze : float = 0

func _ready() -> void:
	velocity = Vector2(speed*cos(rotation),speed*sin(rotation))
	#base color: Color(0.827, 0.396, 0.0)
	if GlobalController.bonus:
		if poison_time>0 and freeze>0:
			$Sprite2D.modulate = Color(0.97, 0.0, 0.455, 1.0)
		elif poison_time>0:
			$Sprite2D.modulate = Color(0.683, 0.295, 1.0)
		elif freeze>0:
			$Sprite2D.modulate = Color(0.0, 0.572, 0.836)

func _physics_process(delta: float) -> void:
	velocity = Vector2(speed*cos(rotation),speed*sin(rotation))
	position += velocity * delta

func _on_hitbox_body_entered(_body: Node2D) -> void:
	queue_free()

func _on_hitbox_area_entered(area: Area2D) -> void:
	if area.get_parent().is_in_group("Enemy"):
		area.get_parent().hurt(damage)
		if poison_time>0:
			area.get_parent().poison(poison_time)
		if freeze>0:
			area.get_parent().speed=area.get_parent().maxSpeed-freeze
			area.get_parent().freeze()
	queue_free()


func _on_timer_timeout() -> void:
	$AnimationPlayer.play("fade")
