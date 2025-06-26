@tool
extends Node2D

@export
var max_points : int = 30
@export
var enabled : bool = false

@onready var trail: Line2D = %Trail
@onready var body: Line2D = $Body

func _ready() -> void:
	trail.clear_points()

func _physics_process(delta: float) -> void:
	if !enabled:
		return
	trail.add_point(global_position)

	if trail.points.size() > max_points:
		trail.remove_point(0)
