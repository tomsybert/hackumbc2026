extends Node
class_name UpgradeManager

var upgrades : Array[Upgrade]
@onready var player = $".."

func _physics_process(delta) -> void:
	for upgrade in upgrades:
		if upgrade.has_update:
			upgrade.Update(delta)

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
	
