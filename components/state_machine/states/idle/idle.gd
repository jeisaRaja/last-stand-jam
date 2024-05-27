extends State
class_name Idle

func enter():
	anim.play(actor.name.to_lower() + "_idle")
	actor.velocity = Vector2.ZERO ## Reset velocity

func physics_update(delta):
	actor.gravity.apply_gravity(delta)
	if actor.movement_input.x != 0:
		change_state.emit(self, "run")	
	## Player Attack
	if actor.attack_input:
		change_state.emit(self, "attack")
	## Player Jump
	if actor.jump_input_actuation:
		change_state.emit(self, "jump")

func _on_health_dead_signal():
	pass

