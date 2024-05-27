extends State
class_name Death


func enter():
	anim.play(actor.name.to_lower() + "_death")
	actor.velocity = Vector2.ZERO

func physics_update(delta):
	pass


