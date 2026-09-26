extends Node2D

var attack = preload("uid://b3ltl83fxacwv")
var attack_cooldown : float = 1.0
var current_attack_cooldown : float = 0
var bullet_speed : float = 400

func _physics_process(delta: float) -> void:
	#Aiming
	self.look_at(get_global_mouse_position())
	
	#Firing
	if Input.is_action_pressed("game_fire") and current_attack_cooldown<=0:
		var bullet = attack.instantiate()
		bullet.global_position = self.global_position
		bullet.rotation = self.rotation
		bullet.speed = bullet_speed
		current_attack_cooldown=attack_cooldown
		$"..".get_parent().add_child(bullet)
	if current_attack_cooldown>0:
		current_attack_cooldown-=delta

func _on_timer_timeout() -> void:
	pass # Replace with function body.
