extends State
class_name Jump

func enter():
	anim.play("jump")
	actor.velocity.y = actor.JUMP_VELOCITY

func physics_update(delta):
	actor_movement()
	actor.gravity.apply_gravity(delta)
	if actor.is_on_floor():
		change_state.emit(self, "idle")
	if actor.dash_input:
		change_state.emit(self, "dash")
	if actor.velocity.y > 0:
		change_state.emit(self, "fall")
