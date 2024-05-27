extends State
class_name Attack

@onready var combo_timer = $ComboTimer
var combo_count = 0

func enter():
	if combo_timer.is_stopped():
		combo_count = 0
	if combo_count == 0:
		anim.play("attack")
		combo_count += 1
	else:
		anim.play("attack_2")
		combo_count = 0
	actor.velocity = Vector2.ZERO

func exit():
	combo_timer.start()

func physics_update(delta):
	if not anim.is_playing():
		change_state.emit(self, "idle")

