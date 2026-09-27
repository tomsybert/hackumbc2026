extends Upgrade

var projectile = preload("uid://xxmd5lnm6l7x")

func Ready() -> void:
	has_update=true
	
func Update(_delta : float) -> void:
	if Input.is_action_pressed("game_fire") and $Timer.is_stopped():
		$Timer.start()
		var bullet = projectile.instantiate()
		bullet.global_position = manager.player.attacker.global_position
		bullet.rotation = manager.player.attacker.rotation
		bullet.speed = 800
		manager.player.get_parent().add_child(bullet)
