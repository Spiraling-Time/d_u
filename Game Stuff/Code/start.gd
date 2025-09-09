extends Node2D

var game_playing: bool = true


func _ready() -> void:
	randomize()
	Input.warp_mouse(get_viewport().get_visible_rect().size / 2)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("mouse_free"):
		if game_playing:
			game_playing = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			
		else:
			game_playing = true
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
			
	if !get_viewport().get_visible_rect().has_point(get_viewport().get_mouse_position()):
		if game_playing:
			game_playing = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)



func next_level():
	get_tree().change_scene_to_file("res://Game Stuff/Scenes/Level2.tscn")
