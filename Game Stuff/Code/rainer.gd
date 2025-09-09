extends CharacterBody2D

var world

var dir = Vector2.ZERO

@onready var blocks = preload("res://Game Stuff/Scenes/block.tscn")
@onready var spawn = $Timer

func _ready() -> void:
	world = get_tree().current_scene
	


func _on_timer_timeout() -> void:
	var newspawn = blocks.instantiate()
	if world.level == "level4":
		if name == "Rainer1": dir = Vector2.LEFT
		elif name == "Rainer2": dir = Vector2.RIGHT
	else: dir = Vector2.DOWN
	newspawn.dir = dir
	var offset
	if dir == Vector2.UP or dir == Vector2.DOWN: offset = Vector2(randi_range(100,-100), 0)
	elif dir == Vector2.LEFT or dir == Vector2.RIGHT: offset = Vector2(0, randi_range(100,-100))
	newspawn.position = global_position + offset
	world.add_child(newspawn)
	spawn.wait_time = randi_range(5,15)/10
	spawn.start()


func _physics_process(delta: float) -> void:
	if world.level == "level3":
		velocity.y = 935
		move_and_slide()
