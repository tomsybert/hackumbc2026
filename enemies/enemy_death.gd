extends Node2D

func _ready():
	$AudioStreamPlayer2D.pitch_scale+=randf_range(-0.2,0.2)
