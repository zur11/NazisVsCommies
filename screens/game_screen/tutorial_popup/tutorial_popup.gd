class_name TutorialPopup extends Control

signal tutorial_finished

@export var total_pages : int = 1
@export var ok_button_texture : Texture
@export var selected_ok_button_texture : Texture
@export var background_thumbnails : Array[Texture]
var _current_page : int = 1

@onready var _current_page_label : Label = $CurrentPageLabel
@onready var _continue_button : TextureButton = $ContinueButton
@onready var _background : TextureRect = $Background

func _ready():
	_update_current_page_label()

func update_background_texture():
	_background.texture = background_thumbnails[_current_page - 1]

func _update_current_page_label():
	_current_page_label.text = "PAGE: " + str(_current_page)

func _on_continue_button_pressed():
	if _current_page == total_pages:
		tutorial_finished.emit()
		return
	
	_current_page += 1
	_update_current_page_label()
	update_background_texture()
	
	if _current_page == total_pages:
		_continue_button.texture_normal = ok_button_texture
		_continue_button.texture_pressed = selected_ok_button_texture
		_continue_button.texture_hover = selected_ok_button_texture

		
