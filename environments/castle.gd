extends StaticBody2D

var enemy = preload("uid://bobys07e4k68a")

func _ready() -> void:
	$Timer.wait_time = randf_range(1,3)

func _on_timer_timeout() -> void:
	var new_enemy = enemy.instantiate()
	new_enemy.global_position = self.global_position
	new_enemy.health = randf_range(GlobalController.enemy_hp.x,GlobalController.enemy_hp.y)
	get_parent().get_parent().add_child(new_enemy)
	$Timer.wait_time = randf_range(GlobalController.enemy_spawn_time.x,GlobalController.enemy_spawn_time.y)
