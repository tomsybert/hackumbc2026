extends Control

var upgrade_text : Array[String] = ["Damage Up","+1 Life","Speed Increase","Fireball Speed"]
var upgrade_pool : Array[String] = ["uid://ch5g1dg0wtkbh","uid://dab1ojx8rxjf","uid://bulgadvnoep3y","uid://j18mj6tfq3r"]
var upg_index : Array[int]

func _ready():
	visible=false

func set_upgrades():
	$AnimationPlayer.play("show")
	upg_index.clear()
	randomize()

	for i in range(3):
		var index = randi_range(0,upgrade_pool.size()-1)
		while upg_index.has(index):
			index = randi_range(0,upgrade_pool.size()-1)
		upg_index.append(index)
	
	$Upgrade1.text = upgrade_text[upg_index[0]]
	$Upgrade2.text = upgrade_text[upg_index[1]]
	$Upgrade3.text = upgrade_text[upg_index[2]]

func _on_upgrade_1_pressed() -> void:
	$"..".player.manager.give_upgrade(upgrade_pool[upg_index[0]])
	finish()

func _on_upgrade_2_pressed() -> void:
	$"..".player.manager.give_upgrade(upgrade_pool[upg_index[1]])
	finish()

func _on_upgrade_3_pressed() -> void:
	$"..".player.manager.give_upgrade(upgrade_pool[upg_index[2]])
	finish()

func finish():
	$"..".pause(false)
	$AnimationPlayer.play("hide")
