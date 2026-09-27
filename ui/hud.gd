extends CanvasLayer


@onready var heart = preload("uid://cagsli5fg8xe5")
@onready var heart_container = $Hearts/HeartContainer
@onready var money_counter = $MoneyCounter/MoneyLabel
#@export var player : CharacterBody2D
var prev_life : int
var score : float


func _ready() -> void:
	prev_life = GlobalController.player.life
	for i in prev_life:
		var heart_piece = heart.instantiate()
		heart_container.add_child(heart_piece)


func _process(_delta: float) -> void:
	if prev_life != GlobalController.player.life:
		for i in heart_container.get_children():
			i.queue_free()
		for i in GlobalController.player.life:
			var heart_piece = heart.instantiate()
			heart_container.add_child(heart_piece)
		prev_life = GlobalController.player.life
	score = GlobalController.player.score
	money_counter.text = "[tornado]$" + str(snappedf(score, 0.01))
