extends Node

enum game_state {
	INACTIVE,
	ACTIVE,
	PAUSED,
	TRANSITIONING,
}

var _current_state = game_state.INACTIVE
var _game : Node = null

var _game_scene : PackedScene = preload("res://YourProjectHere/game.tscn")

var score : float = 0

var high_score : float = 0

func active()->bool:
	return _current_state == game_state.ACTIVE

func start_game()->void:
	if _current_state==game_state.INACTIVE:
		_current_state=game_state.TRANSITIONING
		CrispGDUI.instance.transition_to_dark()
		await get_tree().create_timer(1.1).timeout
		
		var inst = _game_scene.instantiate()
		get_tree().current_scene.add_child(inst)
		_game = inst
		_current_state=game_state.ACTIVE
		CrispGDUI.instance.set_menu_visibility(false)
		
		CrispGDUI.instance.transition_back()
	else:
		push_error("Game scene is already active")

func end_game()->void:
	if _current_state==game_state.ACTIVE:
		if score > high_score:
			high_score = score
		score=0
		_current_state=game_state.TRANSITIONING
		
		CrispGDUI.instance.transition_to_dark()
		await get_tree().create_timer(1.1).timeout
		_current_state=game_state.INACTIVE
		_game.queue_free()
		_game=null
		CrispGDUI.instance.visible=true
		CrispGDUI.instance.transition_back()
	else:
		push_error("Game scene is already inactive")
		
		
