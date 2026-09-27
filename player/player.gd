extends CharacterBody2D
class_name Player

@onready var manager = $UpgradeManager
@onready var attacker = $Attacker
@export var ui : UI
var maxSpeed : float = 250.0
var acceleration : float = 3000.0
var life : int = 3
var score : float = 0.0
var dead = false

func _ready():
	GlobalController.player = self

func _physics_process(delta: float) -> void:
	if !dead:
		var input_vector = Vector2.ZERO
		input_vector = Input.get_vector("game_left","game_right","game_up","game_down")
		velocity = velocity.move_toward(input_vector * maxSpeed, acceleration * delta)
		move_and_slide()
		
		#Anim
		#if input_vector.x!=0||input_vector.y!=0:
		var vect = self.global_position.direction_to(get_global_mouse_position())
		$AnimationTree.set("parameters/BlendSpace2D/blend_position", vect)
		#$AnimationTree.set("parameters/TimeScale/scale", velocity.length()/maxSpeed)

func _on_hitbox_body_entered(body: Node2D) -> void:
	if!dead:
		if body.is_in_group("Enemy"):
			life-=1
			$DeathAnimator.stop()
			$DeathAnimator.play("Hurt")
			body.queue_free()
		if life<=0:
			die()

func die():
	dead=true
	$DeathAnimator.stop()
	$DeathAnimator.play("Die")

func die_paused():
	get_tree().paused=true
	ui.game_over()
