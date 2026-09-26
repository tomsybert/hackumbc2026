extends Upgrade

func Ready() -> void:
	manager.player.life+=1
	pass
	
func Update(_delta : float) -> void:
	pass
