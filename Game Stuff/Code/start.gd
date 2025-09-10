extends Node2D


@onready var level = name

@onready var audio = $AudioStreamPlayer

var game_playing: bool = true


func _ready() -> void:
	randomize()
	Input.warp_mouse(get_viewport().get_window().size / 2)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	audio.play()

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("mouse_free"):
		if game_playing:
			game_playing = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			
		else:
			game_playing = true
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			
	if !get_viewport().get_visible_rect().has_point(get_viewport().get_mouse_position()):
		if game_playing: get_tree().reload_current_scene()



func next_level():
	if level == "level1": get_tree().change_scene_to_file("res://Game Stuff/Scenes/Level2.tscn")
	elif level == "level2": get_tree().change_scene_to_file("res://Game Stuff/Scenes/Level3.tscn")
	elif level == "level3": get_tree().change_scene_to_file("res://Game Stuff/Scenes/Level4.tscn")
	elif level == "level4": get_tree().change_scene_to_file("res://Game Stuff/Scenes/Level5.tscn")
	elif level == "level5":
		get_tree().change_scene_to_file("res://Game Stuff/Scenes/WIN.tscn")
		print("WIN")

func _on_audio_stream_player_finished() -> void:
	audio.play()
