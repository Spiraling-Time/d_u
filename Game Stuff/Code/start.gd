extends Node2D

var game_playing: bool = true
var pressed:bool = false


func _ready() -> void:
	randomize()
	Input.warp_mouse(get_viewport().get_visible_rect().size / 2)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _physics_process(delta: float) -> void:
	
	if Input.get_action_strength("mouse_free") >= 0.5 and !pressed:
		pressed = true
		if game_playing:
			game_playing = false
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
			
		else:
			game_playing = true
			Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	elif pressed:
		await get_tree().process_frame
		pressed = false
