extends State
class_name Idle

func enter():
	anim.play("idle")
	actor.velocity = Vector2.ZERO

func physics_update(delta):
	print(actor)
	actor.gravity.apply_gravity(delta)
	if actor.movement_input.x != 0:
		change_state.emit(self, "run")	
	## Player Attack
	if actor.attack_input:
		change_state.emit(self, "attack")
	## Player Jump
	if actor.jump_input_actuation:
		change_state.emit(self, "jump")
	if actor.dash_input:
		change_state.emit(self, "dash")
	if actor.block_input:
		change_state.emit(self, "block")
	if actor.velocity.y > 0:
		change_state.emit(self, "fall")
		
func _on_health_dead_signal():
	pass

