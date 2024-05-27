extends State
class_name Attack

@onready var combo_timer = $ComboTimer
var combo_count = 0
var attack_pattern = []

func enter():
	attack_pattern = actor.attack_pattern
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
		var attack_type = randomize_attack()
		anim.play(attack_type["name"])
		actor.current_attack = attack_type

func exit():
	combo_timer.start()

func physics_update(delta):
	if not anim.is_playing():
		change_state.emit(self, "idle")

func randomize_attack():
	var rand = randf()
	var cumulative_probability = 0.0
	for attack in attack_pattern:
		cumulative_probability += attack["probability"]
		if rand < cumulative_probability:
			return attack
	return attack_pattern[-1]
