extends CanvasLayer
class_name UI

@export var player : Player
@export var hud : Hud

func call_upgrade_screen():
	$UpgradeScreen.visible=true
	$UpgradeScreen.set_upgrades()
	pause(true)

func pause(state:bool):
	get_tree().paused=state

func _ready():
	$GameOver.visible=false
	$QuittingLabel.visible = false
	GlobalController.ongoing=true
	GlobalController.restart()
	
func game_over():
	hud.game_over()
	GlobalController.ongoing=false
	$GameOver/AnimationPlayer.play("die")
	var amnt = hud.score
	$GameOver/RichTextLabel2.text = "[center]You collected [wave]$" + str(snappedf(amnt, 0.01)) + "[/wave] in royalties!"


func _on_continue_pressed() -> void:
	$Transitioner.start_transit("uid://b0maylxmgq4k1")


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("quit"):
		$QuittingTimer.start()
		$QuittingLabel.visible = true
	if event.is_action_released("quit"):
		$QuittingTimer.stop()
		$QuittingLabel.visible = false


func _on_quitting_timer_timeout() -> void:
	get_tree().change_scene_to_file("uid://b0maylxmgq4k1")
