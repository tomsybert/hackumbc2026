extends Control


@onready var textbox = $TextBox/TextBoxLabel
@onready var advance_texture = $TextBox/AdvanceTexture
@onready var audio_player = $AudioStreamPlayer
@onready var bg_anim: AnimationPlayer = $backgroudns/bg_anim

var visible_characters = 0.0
var text_speed = 40

var text_done : bool = false
var finished=false

var textbox_array = [
	"After years of being cast in the biggest fantasy movies...",
	"...Roy has not seen a single coin for his work.",
	"Roy L. Tee set to take revenge for those who had not paid him any royalies.",
	"[color=yellow]CONTROLS: \nWASD - Move    Mouse - Aim \nLeft Click - Shoot",
	""
]
var textbox_index = 0


func _ready() -> void:
	visible_characters = 0.0
	textbox_index = 0
	textbox.visible_characters = 0
	advance_texture.visible = false
	textbox.text = ""


func _process(delta: float) -> void:
	if !finished:
		if Input.is_action_just_pressed("game_fire") and visible_characters >= textbox_array[textbox_index].length():
			textbox_index += 1
			visible_characters = 0.0
			text_done = false
			if textbox_index == 1:
				bg_anim.play("transition_1")
			elif textbox_index == 2:
				bg_anim.play("transition_2")
		
		if Input.is_action_just_pressed("game_fire") and visible_characters < textbox_array[textbox_index].length() and visible_characters != 0.0:
			text_done = true
			visible_characters = textbox_array[textbox_index].length()
			advance_texture.visible = true
		
	
	if textbox_index > textbox_array.size() - 1:
		textbox_index = textbox_array.size() - 1
	if textbox_index < 0:
		textbox_index = 0
	
	if visible_characters < textbox_array[textbox_index].length() and !text_done:
		advance_texture.visible = false
		visible_characters += text_speed * delta
		if not audio_player.playing:
			audio_player.play()
	else:
		advance_texture.visible = true
	
	if textbox_index > textbox_array.size() - 2:
		finished=true
		$Transitioner.start_transit("uid://bd2y6a1kfxa8g")
	
	textbox.visible_characters = visible_characters
	textbox.text = textbox_array[textbox_index]
	
