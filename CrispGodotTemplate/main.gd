@tool
extends Control


var _game_scene : PackedScene = preload("res://CrispGodotTemplate/main.tscn")

@onready var _title: RichTextLabel = %Title
@onready var _game_description: RichTextLabel = %GameDescription



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

func _ready() -> void:
	pass
