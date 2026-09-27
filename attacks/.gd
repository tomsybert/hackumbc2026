extends Node2D

var blast = preload("uid://cw7i6oq1jovcj")

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		var bl = blast.instantiate()
		bl.global_position = self.global_position
		get_parent().call_deferred("add_child",bl)
		queue_free()
