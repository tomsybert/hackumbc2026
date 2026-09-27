extends Upgrade

var projectile = preload("uid://c8d3to7c3mqwq")

func Ready() -> void:
	lay_egg()
	
func Update(_delta : float) -> void:
	pass
	

func _on_timer_timeout() -> void:
	lay_egg()

func lay_egg():
	var bullet = projectile.instantiate()
	bullet.global_position = manager.player.attacker.global_position
	manager.player.get_parent().add_child(bullet)
