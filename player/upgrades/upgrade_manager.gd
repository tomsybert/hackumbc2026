extends Node
class_name UpgradeManager

var upgrades : Array[Upgrade]
@onready var player = $".."

func _process(_delta) -> void:
	#TODO REMOVE DEBUG
	if Input.is_action_just_pressed("game_debug"):
		give_upgrade("uid://bulgadvnoep3y")

func give_upgrade(upgrade_uid : String):
	var upg = load(upgrade_uid).instantiate()
	if upg is not Upgrade:
		upg.queue_free()
		print("OH NO")
		return 0
	add_child(upg)
	upgrades.append(upg)
	upg.manager = self
	upg.Ready()
	
