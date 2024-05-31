extends State
class_name Run

#@onready var sfx: AudioStreamPlayer2D = $"../../SFX/run"

func enter():
	anim.play("run")

func exit():
	#sfx.stop()
	pass
	
func physics_update(delta):
	#if not sfx.playing:
		#sfx.play()
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
	if actor.dash_input:
		change_state.emit(self, "dash")
	if actor.block_input:
		change_state.emit(self, "block")
	if actor.velocity.y > 0:
		change_state.emit(self, "fall")

