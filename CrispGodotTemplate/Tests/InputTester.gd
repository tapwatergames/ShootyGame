extends Node

@export
var enabled = false

func _ready():
	if !enabled:
		return
	print("touch test enabled")
	CrispGDInput.input_just_pressed.connect(_on_just_pressed)
	CrispGDInput.input_pressed.connect(_on_pressed)
	CrispGDInput.input_released.connect(_on_released)

func _on_just_pressed(pos,delta):
	print("Just pressed at:", pos)

func _on_pressed(pos,delta):
	print("Holding at:", pos)

func _on_released(pos,delta):
	print("Released at:", pos)
