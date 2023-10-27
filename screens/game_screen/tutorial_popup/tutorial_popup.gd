class_name TutorialPopup extends Control

signal tutorial_finished

@export var total_pages : int
@export var ok_button_texture : Texture
var _current_page : int = 1

@onready var _current_page_label : Label = $CurrentPageLabel
@onready var _continue_button : TextureButton = $ContinueButton

func _ready():
	_update_current_page_label()

func _update_current_page_label():
	_current_page_label.text = "PAGE: " + str(_current_page)

func _on_continue_button_pressed():
	if _current_page == total_pages:
		tutorial_finished.emit()
		return
	
	_current_page += 1
	_update_current_page_label()
	
	if _current_page == total_pages:
		_continue_button.texture_normal = ok_button_texture
		_continue_button.texture_pressed = ok_button_texture
		_continue_button.texture_hover = ok_button_texture
		_continue_button.flip_h = false
		
