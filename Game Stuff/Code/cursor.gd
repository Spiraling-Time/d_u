extends Node2D

var speed: int = 15
var previous_pos: Vector2


@onready var world = $".."
@onready var mouse = $cursorSprite
@onready var camera = $Camera2D
@onready var ray = $cursorSprite/RayCast2D
@onready var button_ray = $cursorSprite/RayCast2D2


func _ready() -> void:
	mouse.position = Vector2.ZERO
	previous_pos = mouse.position
	while mouse.position.distance_to(Vector2.ZERO) >= 100: mouse.position = Vector2.ZERO

func _physics_process(delta: float) -> void:
	if world.game_playing:
		if previous_pos:
			ray.target_position = previous_pos-mouse.position
		previous_pos = mouse.position
		mouse.position = mouse.get_global_mouse_position()
		ray.force_raycast_update()
		if ray.is_colliding():
			get_tree().reload_current_scene()
		
		if world.level != "level5":
			if Input.get_action_strength("up") >= 0.5:
				camera.position.y -= speed
			elif Input.get_action_strength("down") >= 0.5:
				camera.position.y += speed
		elif world.level != "WIN": camera.position.y -= speed
		
		if world.level != "WIN":
			if Input.get_action_strength("left") >= 0.5:
				camera.position.x -= speed
			elif Input.get_action_strength("right") >= 0.5:
				camera.position.x += speed
		
		button_ray.force_raycast_update()
		if Input.is_action_just_pressed("clicked"):
			if button_ray.is_colliding(): world.next_level()
	
