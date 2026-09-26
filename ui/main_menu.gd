extends Control


func _ready():
	get_tree().paused=false

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("uid://bd2y6a1kfxa8g")
