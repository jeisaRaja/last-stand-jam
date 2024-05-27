extends RayCast2D

@export var actor: Actor

func _physics_process(_delta):
	detect_ground_ahead()
	
func detect_ground_ahead() -> void:
	if not is_colliding():
		print("not colliding")
		actor.movement_input.x *= -1
