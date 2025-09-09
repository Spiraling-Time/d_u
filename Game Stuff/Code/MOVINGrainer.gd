extends CharacterBody2D

func _physics_process(delta: float) -> void:
	velocity.y = -30
	move_and_slide()
