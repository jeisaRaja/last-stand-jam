extends State
class_name TakeDamage

func enter():
	anim.play("take_damage")
	actor.velocity.x = -actor.facing_dir * 100
	
func exit():
	actor.velocity.x = 0

func physics_update(_delta):
	if not anim.is_playing():
		change_state.emit(self, "idle")



