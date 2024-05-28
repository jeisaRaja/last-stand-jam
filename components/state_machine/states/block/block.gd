extends State
class_name Block

@onready var block_duration = $BlockDuration

func enter():
	block_duration.start(0.6)
	actor.immune = true
	
func physics_update(delta):
	actor_movement()
	actor.gravity.apply_gravity(delta)
	if actor.movement_input.x != 0:
		change_state.emit(self, "run")
	if actor.dash_input:
		change_state.emit(self, "dash")
	if actor.jump_input_actuation:
		change_state.emit(self, "Jump")

func _on_block_duration_timeout():
	print("does timer end")
	actor.immune = false
