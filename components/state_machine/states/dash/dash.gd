extends State
class_name Dash

@onready var dash_duration = $dash_duration
@onready var dash_cooldown = $dash_cooldown

var is_available = true

func enter():
	if not is_available:
		return
	dash_cooldown.start(2)	
	is_available = false
	anim.play("run")
	if actor.movement_input.x:
		actor.velocity.x = actor.SPEED * actor.movement_input.x * 5
	else:
		actor.velocity.x = actor.SPEED * actor.facing_dir * 5
	#actor.set_collision_mask_value(2, false)
	actor.immune = true
	dash_duration.start(0.2)
	
func physics_update(delta):
	if dash_duration.is_stopped():
		change_state.emit(self, "idle")

func exit():
	actor.dash_input = false
	actor.velocity.x = 0
	actor.immune = false
	
func _on_dash_cooldown_timeout():
	is_available = true
