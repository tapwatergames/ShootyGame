@tool
extends Control
class_name CrispGDUI

static var instance : CrispGDUI = null:
	get():
		assert(instance!=null,"instance of mainmenu is null")
		return instance


@onready var _title: RichTextLabel = %Title
@onready var _game_description: RichTextLabel = %GameDescription

@onready var _background_panel: Panel = $BackgroundPanel

@onready var _transition_rect: ColorRect = %TransitionRect
@onready var transition_player: AnimationPlayer = %TransitionPlayer




@export
var mainColor: Color = Color.WHITE:
	set(value):
		mainColor = mainColor
		if _background_panel:
			_background_panel.self_modulate = value
@export
var altColor: Color = Color.BLACK:
	set(value):
		altColor = value
		if _transition_rect:
			_transition_rect.self_modulate = value


@export
var titleText : String = "":
	set(value):
		titleText = value
		if _title:  # Check if _title is initialized
			_title.text = "[center]" + value
			

@export_multiline
var descriptionText : String = "":
	set(value):
		descriptionText = value
		if _game_description:  # Check if _title is initialized
			_game_description.text = value

func set_menu_visibility(value:bool)->void:
	visible = value

func transition_to_dark()->void:
	transition_player.play("DiamondTransition")

func transition_back()->void:
	transition_player.play_backwards("DiamondTransition")

func _ready() -> void:
	instance = self
