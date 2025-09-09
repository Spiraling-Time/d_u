extends CharacterBody2D

var world

@onready var blocks = preload("res://Game Stuff/Scenes/block.tscn")
@onready var spawn = $Timer

func _ready() -> void:
	world = get_tree().current_scene
	


func _on_timer_timeout() -> void:
	var newspawn = blocks.instantiate()
	newspawn.position = global_position + Vector2(randi_range(100,-100), 0)
	world.add_child(newspawn)
	spawn.wait_time = randi_range(5,15)/10
	spawn.start()


func _physics_process(delta: float) -> void:
	if world.level == "level3":
		velocity.y = 900
		move_and_slide()
