extends CharacterBody2D

var health : float = 1.0
var speed = 5000.0
var upgrade = preload("uid://disdjs3wyk2s6")

func _ready() -> void:
	pass

func hurt(damage:float):
	health-=damage
	$HurtAnim.stop()
	$HurtAnim.play("Hurt")
	if health<=0:
		var rand = randi_range(1,GlobalController.upgrade_chance)
		if rand==GlobalController.upgrade_chance:
			var upg = upgrade.instantiate()
			upg.global_position=self.global_position
			get_parent().call_deferred("add_child",upg)
			
		queue_free()

func _physics_process(delta: float) -> void:
	if GlobalController.player:
		velocity = position.direction_to(GlobalController.player.position) * speed * delta
	
	$AnimationTree.set("parameters/BlendSpace2D/blend_position",speed*position.direction_to(GlobalController.player.position))
	
	move_and_slide()
