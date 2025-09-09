extends Node2D

@onready var mouse = $cursorSprite

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _physics_process(delta: float) -> void:
	mouse.position = mouse.get_global_mouse_position()
