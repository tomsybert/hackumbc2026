extends Upgrade

func Ready() -> void:
	manager.player.attacker.freeze += 1000
	
func Update(_delta : float) -> void:
	pass
