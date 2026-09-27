extends Node

var player : Player

var upgrade_chance : int = 5

var enemy_spawn_time : Vector2 = Vector2(5,15) #Default 2, 15

var level_time : float = 30
var level := 0 #default 0
var enemy_hp : Vector2 = Vector2(1,1) #default 1,1

func restart():
	enemy_spawn_time = Vector2(5,15)
	level = 0
	enemy_hp = Vector2(5,15)

func _process(delta: float) -> void:
	level_time-=delta
	if level_time<=0:
		level_time = 30
		level+=1
		print("LEVEL UP")
		match level:
			1:
				enemy_spawn_time = Vector2(5,12)
				enemy_hp = Vector2(1,2)
			2:
				enemy_spawn_time = Vector2(5,12)
				enemy_hp = Vector2(1,3)
			3:
				enemy_spawn_time = Vector2(5,10)
				enemy_hp = Vector2(2,3)
			4:
				enemy_spawn_time = Vector2(4,10)
				enemy_hp = Vector2(2,4)
			5:
				enemy_spawn_time = Vector2(4,8)
				enemy_hp = Vector2(3,5)
			6:
				enemy_spawn_time = Vector2(3,7)
				enemy_hp = Vector2(4,6)
			7:
				enemy_spawn_time = Vector2(3,6)
				enemy_hp = Vector2(5,8)
			8:
				enemy_spawn_time = Vector2(2,5)
				enemy_hp = Vector2(8,10)
			9:
				enemy_spawn_time = Vector2(1,4)
				enemy_hp = Vector2(13,15)
			10:
				enemy_spawn_time = Vector2(1,2)
				enemy_hp = Vector2(15,30)
