extends Upgrade

func Ready() -> void:
	manager.player.attacker.damage+=0.1
	pass
	
func Update(_delta : float) -> void:
	pass
