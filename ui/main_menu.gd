extends Control


func _ready():
	get_tree().paused=false

func _on_button_pressed() -> void:
	$Transitioner.start_transit("uid://dvc2vbqbor6dt")
