extends Node

@onready var music_player: AudioStreamPlayer = $MusicPlayer

func _ready() -> void:
	CrispGDInput.input_just_pressed.connect(_on_input_just_pressed)
	CrispGDUtility.game_started.connect(_on_game_started)
	CrispGDUtility.game_ended.connect(_on_game_ended)
	
func _on_input_just_pressed(pos,delta)->void:
	if !CrispGDUtility.active():
		CrispGDUtility.start_game()
		
func _on_game_started()->void:
	music_player.volume_db = 0
	music_player.play()
	
func _on_game_ended()->void:
	var tween: Tween  = get_tree().create_tween()
	tween.tween_property(music_player,"volume_db",-64,1)
	await tween.finished
	music_player.stop()
