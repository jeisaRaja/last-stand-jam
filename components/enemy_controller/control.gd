extends Node2D
class_name ControlClass

@export var enemy: Actor = null
var player: Actor = null

# Wander
var wander_center: float
var is_wandering: bool = false
var wander_target: float

func go_to_target(x_pos: float):
	if x_pos > enemy.position.x:
		enemy.movement_input.x = 1
	elif x_pos < enemy.position.x:
		enemy.movement_input.x = -1

func wander_around(radius: float) -> float:
	var target_position = wander_center + (-1 * enemy.facing_dir * radius)
	if target_position > enemy.global_position.x:
		enemy.movement_input.x = 1
	else:
		enemy.movement_input.x = -1
	return target_position
	
func dash_left():
	enemy.movement_input.x = -1
	enemy.dash_input = true

func dash_right():
	enemy.movement_input.x = 1
	enemy.dash_input = true

func jump_left():
	enemy.movement_input.x = -1
	enemy.jump_input_actuation = true

func jump_right():
	enemy.movement_input.x = 1
	enemy.jump_input_actuation = true

func make_immune_to_damage(duration: float):
	enemy.immune = true
	var timer: Timer = Timer.new()
	add_child(timer)
	timer.one_shot = true
	timer.autostart = false
	timer.wait_time = duration
	timer.timeout.connect(_immune_timer_timeout)

func _immune_timer_timeout():
	enemy.immune = false
	queue_free()

func attack_1():
	enemy.attack_input_1 = true
	
func attack_2():
	enemy.attack_input_2 = true

func attack_3():
	enemy.attack_input_3 = true

func attack_4():
	enemy.attack_input_4 = true

func block_attack():
	enemy.block_input = true
