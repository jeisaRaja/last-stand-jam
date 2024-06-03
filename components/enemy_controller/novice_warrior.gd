extends ControlClass
class_name NoviceWarriorController

var wander_radius: int = 100
var attack_pattern = [
		{"name": "attack", "damage": 10, "range": 60},
		{"name": "attack_2", "damage": 20, "range": 70},
		{"name": "attack_3", "damage": 30, "range": 85}
]

var hit_count: int = 0
var dash_count: int = 0
var attack_count: int = 0
var is_attacking: bool = false
var signal_connected: bool = false

func _ready():
	wander_center = enemy.global_position.x
	enemy.attack_pattern = attack_pattern
	
func _process(_delta):
	if player and not signal_connected:
		player.connect("dead_signal", _on_player_dead)
		signal_connected = true
		
func _physics_process(_delta):
	var distance_to_target = abs(enemy.global_position.x - target_position)
	if player == null:
		control_wander(distance_to_target)
	else:
		is_wandering = false
		go_to_target(player.global_position.x)
		enemy.current_attack = attack_pattern[attack_count]
		if distance_to_target < enemy.current_attack["range"] and not is_attacking:
			stop_x_input()
			attack()
			is_attacking = true
			attack_count += 1
			if attack_count > 2:
				attack_count = 0
	if hit_count > 0 and hit_count % 3 == 0 and hit_count/(dash_count+1) == 3:
		if enemy.global_position.x < player.global_position.x:
			dash_right()
		else:
			dash_left()
		dash_count += 1

func _on_detection_area_body_entered(body):
	if body.is_in_group("player"):
		player = body

func _on_health_damage_signal():
	hit_count += 1

func control_wander(distance_to_target):
	if not is_wandering:
		is_wandering = true
		wander_around(wander_radius)
	else:
		if distance_to_target < 1:
			wander_around(wander_radius)

func _on_attack_attack_finished():
	is_attacking = false

func _on_player_dead():
	player = null
