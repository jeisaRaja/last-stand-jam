extends State
class_name Death

func enter():
	anim.play("death")
	actor.velocity = Vector2.ZERO
	actor.set_collision_mask_value(2, false)
	
func physics_update(delta):
	actor.gravity.apply_gravity(delta)

