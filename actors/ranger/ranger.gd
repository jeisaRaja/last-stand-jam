extends EnemeyWithControl
class_name Ranger

var attack_count: int = 0

func _ready():
	super._ready()
	attack_pattern = [
		{"name": "attack", "damage": 10, "range": 300}
	]

func _physics_process(_delta):
	super._physics_process(_delta)
	target_position = player.global_position.x
	var distance_to_target = abs(global_position.x - target_position)
	if player:
		current_attack = attack_pattern[attack_count]
		if distance_to_target < current_attack["range"]:
			attack()

func flip():
	super.flip()
	detection_area.scale.x *= -1

func alert(player: Actor):
	alert_enemy.emit(player)

