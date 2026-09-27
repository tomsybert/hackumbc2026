extends Upgrade

func Ready() -> void:
	manager.player.attacker.spread+=PI/16
	pass
	
func Update(_delta : float) -> void:
	pass
