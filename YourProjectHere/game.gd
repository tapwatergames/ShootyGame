extends Node


func _ready() -> void:
	CrispGDInput.input_just_pressed.connect(play)
	
	
	
func play(a,b)->void:
	CrispGDUtility.end_game()
