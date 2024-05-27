extends State
class_name Attack


func enter():
	anim.play(actor.name.to_lower() + "_attack")
	actor.velocity = Vector2.ZERO

func physics_update(delta):
	if not anim.is_playing():
		change_state.emit(self, "idle")

