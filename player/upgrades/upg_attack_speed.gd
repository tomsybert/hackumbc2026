extends Upgrade

func Ready() -> void:
	manager.player.attacker.attack_cooldown-=manager.player.attacker.attack_cooldown*0.33
	pass
	
func Update(_delta : float) -> void:
	pass
