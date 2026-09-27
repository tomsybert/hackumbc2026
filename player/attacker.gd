extends Node2D

var attack = preload("uid://b3ltl83fxacwv")
var attack_cooldown : float = 0.05
var current_attack_cooldown : float = 0
var bullet_speed : float = 300
var damage : float = 0.1
var bullet_size : float = 0.8
var spread : float = 0
var poison_time : float = 0
var freeze : float = 0

func _physics_process(delta: float) -> void:
	#Aiming
	self.look_at(get_global_mouse_position())
	
	#Firing
	if Input.is_action_pressed("game_fire") and current_attack_cooldown<=0:
		$Fire.play()
		var bullet = attack.instantiate()
		bullet.global_position = self.global_position
		bullet.rotation = self.rotation
		bullet.speed = bullet_speed
		bullet.damage=damage
		bullet.scale.x=bullet_size
		bullet.scale.y=bullet_size
		bullet.poison_time=poison_time
		bullet.freeze=freeze
		current_attack_cooldown=attack_cooldown
		bullet.rotation+=randf_range(-1*spread,spread)
		$"..".get_parent().add_child(bullet)
	if current_attack_cooldown>0:
		current_attack_cooldown-=delta

func _on_timer_timeout() -> void:
	pass # Replace with function body.
