extends Upgrade

func Ready() -> void:
	if GlobalController.bonus:
		manager.player.attacker.spread+=PI/8
	else:
		manager.player.attacker.spread+=PI/16
	pass
	
func Update(_delta : float) -> void:
	pass
