extends CharacterBody2D

var health : float = 1.0
var speed = 5000.0
var maxSpeed = 0
var upgrade = preload("uid://disdjs3wyk2s6")
var death_effect = preload("uid://bqnddhd58gt27")

func _ready() -> void:
	speed = GlobalController.enemy_speed
	maxSpeed = speed

func freeze():
	$Visuals.modulate = Color(0.462, 0.839, 1.0)

func hurt(damage:float):
	health-=damage
	$HurtAnim.stop()
	$HurtAnim.play("Hurt")
	var sfx_rand = randi_range(0,1)
	var pitch = randf_range(-0.2,0.2)
	if sfx_rand==0:
		$hit1.play()
		$hit1.pitch_scale=1+pitch
	if sfx_rand==1:
		$hit2.play()
		$hit2.pitch_scale=1+pitch
	if health<=0:
		GlobalController.upgrade_amnt+=1
		if GlobalController.upgrade_amnt==GlobalController.upgrade_target:
			var upg = upgrade.instantiate()
			upg.global_position=self.global_position
			get_parent().call_deferred("add_child",upg)
			GlobalController.reroll_upgrade()
		var de = death_effect.instantiate()
		de.global_position = self.global_position
		get_parent().add_child(de)
		queue_free()
		GlobalController.player.score += randf_range(5.01, 15.99)

func _physics_process(delta: float) -> void:
	#WARNING This may cause problems if I add the confusion buff or want them to run away
	if speed<=0:
		speed=0
		
	if GlobalController.player:
		velocity = position.direction_to(GlobalController.player.position) * speed * delta
	
	$AnimationTree.set("parameters/BlendSpace2D/blend_position",speed*position.direction_to(GlobalController.player.position))
	
	move_and_slide()

func poison(time:float):
	$PoisonCounter.wait_time=time
	$PoisonCounter.start()
	modulate = Color(0.816, 0.486, 1.0)

func _on_poison_counter_timeout() -> void:
	hurt(0.5)
