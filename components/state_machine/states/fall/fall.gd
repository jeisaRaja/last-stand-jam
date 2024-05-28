extends State
class_name Fall

func enter():
	anim.play("fall")

func physics_update(delta):
	actor_movement()
	actor.gravity.apply_gravity(delta)
	if actor.is_on_floor():
		change_state.emit(self, "idle")
	if actor.dash_input:
		change_state.emit(self, "dash")
