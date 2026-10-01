extends Node

var bonus : bool = true

var player : Player

var upgrade_chance : Vector2i = Vector2i(10,20)
var upgrade_amnt : int = 0
var upgrade_target : int = 2

var enemy_spawn_time : Vector2 = Vector2(5,15) #Default 2, 15

var level_time : float = 30
var level := 0 #default 0
var enemy_hp : Vector2 = Vector2(1,1) #default 1,1
var enemy_speed : float = 5000.0
var ongoing = false

func restart():
	enemy_spawn_time = Vector2(5,15)
	level = 0
	enemy_hp = Vector2(1,1)
	upgrade_amnt=0
	upgrade_target = 2
	if bonus:
		upgrade_chance = Vector2i(10,20) #TODO Change this to 5,15 if I add more upgrades
	else:
		upgrade_chance = Vector2i(10,20)

func reroll_upgrade():
	upgrade_amnt = 0
	upgrade_target = randi_range(upgrade_chance.x,upgrade_chance.y)

func _process(delta: float) -> void:
	if(Input.is_action_just_pressed("fullscreen")):
		if DisplayServer.window_get_mode() != DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_size(Vector2i(ProjectSettings.get_setting("display/window/size/window_width_override"),ProjectSettings.get_setting("display/window/size/window_height_override")))
	
	if ongoing:
		level_time-=delta
		if level_time<=0:
			level_time = 30
			level+=1
			print("LEVEL UP")
			match level:
				1:
					enemy_spawn_time = Vector2(5,12)
					enemy_hp = Vector2(1,2)
					enemy_speed=5000.0
				2:
					enemy_spawn_time = Vector2(5,12)
					enemy_hp = Vector2(1,3)
					enemy_speed=5000.0
				3:
					enemy_spawn_time = Vector2(5,10)
					enemy_hp = Vector2(2,3)
					enemy_speed=5000.0
				4:
					enemy_spawn_time = Vector2(4,10)
					enemy_hp = Vector2(2,4)
					enemy_speed=5000.0
				5:
					enemy_spawn_time = Vector2(4,8)
					enemy_hp = Vector2(3,5)
					enemy_speed=6000.0
				6:
					enemy_spawn_time = Vector2(3,7)
					enemy_hp = Vector2(4,6)
					enemy_speed=6000.0
				7:
					enemy_spawn_time = Vector2(3,6)
					enemy_hp = Vector2(5,8)
					enemy_speed=6000.0
				8:
					enemy_spawn_time = Vector2(2,5)
					enemy_hp = Vector2(8,10)
					enemy_speed=6000.0
				9:
					enemy_spawn_time = Vector2(1,4)
					enemy_hp = Vector2(13,15)
					enemy_speed=7000.0
				10:
					enemy_spawn_time = Vector2(1,2)
					enemy_hp = Vector2(15,30)
				12:
					enemy_spawn_time = Vector2(1,2)
					enemy_hp = Vector2(50,100)
					enemy_speed=8000.0
