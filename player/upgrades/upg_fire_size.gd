extends Upgrade

func Ready() -> void:
	if GlobalController.bonus:
		manager.player.attacker.bullet_size+=0.5
	else:
		manager.player.attacker.bullet_size+=0.2
	
func Update(_delta : float) -> void:
	pass
