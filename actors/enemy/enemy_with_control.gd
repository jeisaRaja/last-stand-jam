extends Enemy
class_name EnemeyWithControl

@export var enemy: CharacterBody2D
var player: Actor
#var player: Actor = null

# Wander
var wander_center: float
var is_wandering: bool = false

var target_position: float

func go_to_target(x_pos: float):
	var distance_to_target = abs(enemy.global_position.x - x_pos)
	if distance_to_target < 10:
		enemy.movement_input.x = 0
		return
	if x_pos > enemy.global_position.x:
		enemy.movement_input.x = 1
	elif x_pos < enemy.global_position.x:
		enemy.movement_input.x = -1
	target_position = x_pos

func wander_around(radius: float):
	target_position = wander_center + (-1 * enemy.facing_dir * radius)
	var distance_to_target = abs(enemy.global_position.x - target_position)
	print(distance_to_target)
	if distance_to_target < 2:
		enemy.movement_input.x = 0
		return
	if target_position > enemy.global_position.x:
		enemy.movement_input.x = 1
	else:
		enemy.movement_input.x = -1

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

func attack():
	enemy.attack_input = true

func stop_x_input():
	enemy.movement_input.x = 0
