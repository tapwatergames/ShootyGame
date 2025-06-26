extends Node2D



@export
var movement_weight = 10.0
@export
var rotation_weight = 5.0

enum aim_status {
	NONE,
	UNLOCKED_AIM,
	LOCKED_AIM,
}

var input_offset = Vector2.ZERO
@onready
var last_position = position
var my_status : aim_status = aim_status.NONE

func _ready() -> void:
	CrispGDInput.input_just_pressed.connect(on_input_just_pressed)
	CrispGDInput.input_released.connect(on_input_just_released)
	CrispGDInput.input_pressed.connect(on_input_pressed)
	

func _physics_process(_delta: float) -> void:
	last_position = position
	
func on_input_pressed(pos: Vector2,_delta:float)->void:
	if my_status == aim_status.UNLOCKED_AIM or my_status == aim_status.LOCKED_AIM:
		position = lerp(position, pos - input_offset,_delta*movement_weight)
		
	if my_status == aim_status.UNLOCKED_AIM:
		var direction = last_position.angle_to(position)
		look_at(pos - input_offset)
		rotation_degrees += 90


func on_input_just_pressed(pos: Vector2,_delta)->void:
	if pos.x < get_viewport_rect().size.x/2:
		my_status = aim_status.UNLOCKED_AIM
	else:
		my_status = aim_status.LOCKED_AIM
	input_offset = pos - position
		
func on_input_just_released(pos: Vector2,_delta)->void:
	my_status = aim_status.NONE
	
