extends Control


@onready var textbox = $TextBox/TextBoxLabel
@onready var advance_texture = $TextBox/AdvanceTexture
@onready var audio_player = $AudioStreamPlayer

var visible_characters = 0.0
var text_speed = 40

var textbox_array = [
	"This is text box number 1!",
	"This is the second textbox, numero dos! dos!dos!dos!dos!dos!dos!dos!dos!dos!dos!dos!"
]
var textbox_index = 0


func _ready() -> void:
	visible_characters = 0.0
	textbox_index = 0
	textbox.visible_characters = 0
	advance_texture.visible = false
	textbox.text = ""


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("game_fire"):
		textbox_index += 1
		visible_characters = 0.0
	
	if textbox_index > textbox_array.size() - 1:
		textbox_index = textbox_array.size() - 1
	if textbox_index < 0:
		textbox_index = 0
	
	if visible_characters < textbox_array[textbox_index].length():
		advance_texture.visible = false
		visible_characters += text_speed * delta
		if not audio_player.playing:
			audio_player.play()
	else:
		advance_texture.visible = true
	
	textbox.visible_characters = visible_characters
	textbox.text = textbox_array[textbox_index]
