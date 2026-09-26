extends Upgrade

func Ready() -> void:
	manager.player.maxSpeed+=100
	manager.player.acceleration+=10000
	pass
	
func Update(_delta : float) -> void:
	pass
