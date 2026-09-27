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
	
func game_over():
	hud.game_over()
	$GameOver/AnimationPlayer.play("die")
	var amnt = hud.score
	$GameOver/RichTextLabel2.text = "[center]You collected [wave]$" + str(snappedf(amnt, 0.01)) + "[/wave] in royalties!"


func _on_continue_pressed() -> void:
	$Transitioner.start_transit("uid://b0maylxmgq4k1")
