extends Upgrade

func Ready() -> void:
	manager.player.attacker.bullet_speed+=50
	pass
	
func Update(_delta : float) -> void:
	pass
