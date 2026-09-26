extends CanvasLayer
class_name UI

@export var player : Player

func call_upgrade_screen():
	$UpgradeScreen.visible=true
	$UpgradeScreen.set_upgrades()
	pause(true)

func pause(state:bool):
	get_tree().paused=state

func _ready():
	$GameOver.visible=false
	
func game_over():
	$GameOver/AnimationPlayer.play("die")


func _on_continue_pressed() -> void:
	get_tree().change_scene_to_file("uid://b0maylxmgq4k1")
