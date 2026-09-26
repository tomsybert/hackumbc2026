extends Node2D

var attack = preload("uid://b3ltl83fxacwv")

func _physics_process(_delta: float) -> void:
	#Aiming
	self.look_at(get_global_mouse_position())
	
	#Firing
	if Input.is_action_just_pressed("game_fire"):
		var bullet = attack.instantiate()
		bullet.global_position = self.global_position
		bullet.rotation = self.rotation
		$"..".get_parent().add_child(bullet)
