extends State
class_name Dash

@onready var dash_duration = $dash_duration

func enter():
	anim.play("run")
	if actor.movement_input.x:
		actor.velocity.x = actor.SPEED * actor.movement_input.x * 3
	else:
		actor.velocity.x = actor.SPEED * actor.facing_dir * 3
	#actor.set_collision_mask_value(2, false)
	actor.immune = true
	dash_duration.start(0.2)
	
func physics_update(delta):
	if dash_duration.is_stopped():
		change_state.emit(self, "idle")

func exit():
	actor.velocity.x = 0
	actor.immune = false
