extends CanvasLayer
class_name UI

@export var player : Player

func call_upgrade_screen():
	$UpgradeScreen.visible=true
	$UpgradeScreen.set_upgrades()
	pause(true)

func pause(state:bool):
	get_tree().paused=state
