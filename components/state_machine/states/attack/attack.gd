extends State
class_name Attack

@onready var combo_timer = $ComboTimer
@onready var sfx = $"../../SFX/attack"
var combo_count = 0

func enter():
	if actor.is_in_group("player"):
		if combo_timer.is_stopped():
			combo_count = 0
		anim.play(actor.attack_pattern[combo_count]["name"])
		actor.current_attack = actor.attack_pattern[combo_count]
		combo_count += 1
		actor.velocity = Vector2.ZERO
		if combo_count == actor.attack_pattern.size():
			combo_count = 0
	elif actor.is_in_group("enemy"):
		anim.play(actor.current_attack["name"])
	sfx.play()

func exit():
	combo_timer.start()

func physics_update(delta):
	if not anim.is_playing():
		change_state.emit(self, "idle")


