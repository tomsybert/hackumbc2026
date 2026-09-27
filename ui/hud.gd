extends CanvasLayer


@onready var heart = preload("uid://cagsli5fg8xe5")
@onready var heart_container = $Hearts/HeartContainer
@export var player : CharacterBody2D
var prev_life : int


func _ready() -> void:
	prev_life = player.life
	for i in prev_life:
		var heart_piece = heart.instantiate()
		heart_container.add_child(heart_piece)


func _process(_delta: float) -> void:
	if prev_life != player.life:
		for i in prev_life:
			heart_container.get_child(0).queue_free()
		for i in player.life:
			var heart_piece = heart.instantiate()
			heart_container.add_child(heart_piece)
		prev_life = player.life
