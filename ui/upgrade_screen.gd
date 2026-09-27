extends Control

var upgrade_text : Array[String] = [
	"Stronger Flames","+1 Life",
	"Movement Speed Increase","Flame Distance Increase",
	"Flame Size Increase","Widen Spread",
	"Poison Breath","Frost Flames",
	"Additional Fireball","Lay Egg Mines"]
var upgrade_pool : Array[String] = [
	"uid://ch5g1dg0wtkbh","uid://dab1ojx8rxjf",
	"uid://bulgadvnoep3y","uid://j18mj6tfq3r",
	"uid://bvhtwq2x6kq4v","uid://dqsnmnybrkoam",
	"uid://xm202ur7sd1g","uid://cilqroi6y42lx",
	"uid://d2mt73cpcven5","uid://cxqtw65twk427"]
var upgrade_icons : Array[String] = [
	"uid://dx1k0ww0n3dcx","uid://dw3q814vrcx82",
	"uid://dfop5n3mraxsc","uid://fmigxjy0wura",
	"uid://fmigxjy0wura","uid://bi53v2f7qrm7l",
	"uid://dht4rl2kuykfn","uid://21lcbkuengyi",
	"uid://fmigxjy0wura","uid://cp8sswr66yj24",
]
var upgrade_colors : Array[Color] = [
	Color(0.827, 0.396, 0.0),Color(1,1,1),
	Color(0.275, 0.792, 1.0, 1.0),Color(0.827, 0.396, 0.0),
	Color(0.827, 0.396, 0.0),Color(0.243, 1.0, 0.357, 1.0),
	Color(0.639, 0.0, 0.933, 1.0),Color(0.0, 0.741, 1.0, 1.0),
	Color(0.827, 0.145, 0.0),Color(1,1,1),
]
var upg_index : Array[int]
var poisoned = false

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
	$Upgrade1/Icon.texture = load(upgrade_icons[upg_index[0]])
	$Upgrade1/Icon.self_modulate = upgrade_colors[upg_index[0]]
	$Upgrade2.text = upgrade_text[upg_index[1]]
	$Upgrade2/Icon.texture = load(upgrade_icons[upg_index[1]])
	$Upgrade2/Icon.self_modulate = upgrade_colors[upg_index[1]]
	$Upgrade3.text = upgrade_text[upg_index[2]]
	$Upgrade3/Icon.texture = load(upgrade_icons[upg_index[2]])
	$Upgrade3/Icon.self_modulate = upgrade_colors[upg_index[2]]

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
