extends State
class_name Run

func enter():
	anim.play(actor.name.to_lower() + "_run")

func physics_update(delta):
	actor.gravity.apply_gravity(delta)
	actor_movement()
	actor.velocity.x = actor.SPEED * actor.movement_input.x
	if actor.movement_input.x == 0:
		change_state.emit(self, "idle")
	## Player Attack
	if actor.attack_input:
		change_state.emit(self, "attack")
	## Player Jump
	if actor.jump_input_actuation:
		change_state.emit(self, "jump")

