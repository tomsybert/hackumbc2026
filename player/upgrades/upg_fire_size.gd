extends Upgrade

func Ready() -> void:
	manager.player.attacker.bullet_size+=0.2
	pass
	
func Update(_delta : float) -> void:
	pass
