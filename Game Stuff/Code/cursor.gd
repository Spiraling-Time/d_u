extends Node2D

var speed: int = 10
var previous_pos: Vector2

@onready var world = $".."
@onready var mouse = $cursorSprite
@onready var camera = $Camera2D
@onready var ray = $cursorSprite/RayCast2D

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if world.game_playing:
		if previous_pos:
			ray.target_position = previous_pos-mouse.position
		previous_pos = mouse.position
		mouse.position = mouse.get_global_mouse_position()
		ray.force_raycast_update()
		if ray.is_colliding():
			get_tree().reload_current_scene()
		
		if Input.get_action_strength("up") >= 0.5:
			camera.position.y -= speed
		elif Input.get_action_strength("down") >= 0.5:
			camera.position.y += speed
		
		if Input.get_action_strength("left") >= 0.5:
			camera.position.x -= speed
		elif Input.get_action_strength("right") >= 0.5:
			camera.position.x += speed
