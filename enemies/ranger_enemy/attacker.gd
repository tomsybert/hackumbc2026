extends Node2D

var attack = preload("uid://lrvbb45nvo6s")

func _physics_process(_delta: float) -> void:
	var arrow = attack.instantiate()
	arrow.global_position = self.global_position
	arrow.rotation = self.rotation
	$"..".get_parent().add_child(arrow)
	arrow.player = $"..".player
