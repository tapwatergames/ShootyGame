extends Node


func _ready() -> void:
	CrispGDInput.input_just_pressed.connect(_on_input_just_pressed)


func _on_input_just_pressed(pos,delta)->void:
	if !CrispGDUtility.active():
		print("starting game")
		CrispGDUtility.start_game()
