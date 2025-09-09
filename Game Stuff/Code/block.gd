extends CharacterBody2D

@onready var despawn = $Timer

var speed: int = 10

func _ready() -> void:
	despawn.start()

func _physics_process(delta: float) -> void:
	velocity.y += speed
	move_and_slide()

func _on_timer_timeout() -> void:
	queue_free()
