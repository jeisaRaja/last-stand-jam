extends State
class_name Jump

func enter():
	anim.play(actor.name.to_lower() + "_jump")
	actor.velocity.y = actor.JUMP_VELOCITY

func physics_update(delta):
	actor_movement()
	actor.gravity.apply_gravity(delta)
	if actor.is_on_floor():
		change_state.emit(self, "idle")
