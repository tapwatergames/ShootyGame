extends Node


func _ready() -> void:
	CrispGDInput.input_just_pressed.connect(play)
	
	
	
func play(a,b)->void:
	
	$SfxrStreamPlayer.play()
	
	print("sss")
