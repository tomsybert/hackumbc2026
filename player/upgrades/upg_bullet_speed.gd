extends Upgrade

func Ready() -> void:
	manager.player.attacker.bullet_speed+=100
	pass
	
func Update(_delta : float) -> void:
	pass
