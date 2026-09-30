extends Control

@onready var music_bus = AudioServer.get_bus_index("Music")
@onready var sfx_bus = AudioServer.get_bus_index("SFX")

func _ready():
	get_tree().paused=false
	$music_slider.value = AudioServer.get_bus_volume_linear(music_bus)
	$sfx_slider.value = AudioServer.get_bus_volume_linear(sfx_bus)
	$CheckButton.button_pressed = GlobalController.bonus
	bonus_text()

func _on_button_pressed() -> void:
	$Transitioner.start_transit("uid://dvc2vbqbor6dt")

func _on_music_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(music_bus, linear_to_db(value))


func _on_sfx_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(sfx_bus, linear_to_db(value))

func _on_check_button_pressed() -> void:
	GlobalController.bonus = $CheckButton.button_pressed
	bonus_text()

func bonus_text():
	if GlobalController.bonus:
		$CheckButton.text = "Bonus Content (On)"
	else:
		$CheckButton.text = "Bonus Content (Off)"
