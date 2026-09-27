extends Upgrade

func Ready() -> void:
	if manager.player.attacker.poison_time ==0:
		manager.player.attacker.poison_time = 2
	elif manager.player.attacker.poison_time ==0.2:
		pass
	else:
		manager.player.attacker.poison_time -= 0.2
	
func Update(_delta : float) -> void:
	pass
