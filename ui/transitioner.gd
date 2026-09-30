extends Control

var path : String

func _ready():
	visible=true

func start_transit(p:String):
	path=p
	$AnimationPlayer.play("FadeIn")

func transit():
	get_tree().change_scene_to_file(path)
