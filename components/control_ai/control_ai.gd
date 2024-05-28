extends Node

@export var actor: Actor
@export var base_attack_range: int 

@onready var wait: Timer = $Wait

var player: Actor = null
var chase_player: bool = false

var attack_pattern = []

func _physics_process(delta):
	enemy_input()

func _on_detection_area_body_entered(body):
	if body.name.to_lower() == "player":
		player = body
		if is_player_alive() and not chase_player:
			get_tree().call_group("enemy", "alert", player)
			chase_player = true

func _on_detection_area_body_exited(body):
	#chase_player = false
	#player = null
	actor.attack_input = false
	#actor.SPEED = actor.BASE_SPEED
	
func enemy_input():
	actor.movement_input = Vector2.ZERO
	actor.attack_input = false
	if chase_player:
		var distance_to_player = abs(player.position.x - actor.position.x)
		if not is_player_alive():
			chase_player = false
			actor.attack_input = false
			actor.SPEED = actor.BASE_SPEED
		elif distance_to_player > randomize_attack_range():
			actor.attack_input = false
			if player.position.x > actor.position.x:
				actor.movement_input.x = 1
			else:
				actor.movement_input.x = -1
		else:
			if actor.facing_dir == 1 and actor.position.x > player.position.x:
				actor.movement_input.x = -1
				actor.attack_input = false
			elif actor.facing_dir == -1 and actor.position.x < player.position.x:
				actor.movement_input.x = 1
				actor.attack_input = false
			else:
				if actor.can_attack:
					var attack_type = randomize_attack()
					actor.can_attack = false
					wait.start(attack_type["cooldown"])
					actor.current_attack = attack_type
					actor.attack_input = true
	else:
		actor.movement_input.x = actor.facing_dir

func is_player_alive():
	return player.health_component.current_health > 0

func _on_enemy_alert_enemy(player_obj):
	player = player_obj
	chase_player = true
	actor.SPEED += 150

func randomize_attack_range():
	return base_attack_range + randi_range(-20,11)

func randomize_attack():
	var rand = randf()
	var cumulative_probability = 0.0
	for attack in actor.attack_pattern:
		cumulative_probability += attack["probability"]
		if rand < cumulative_probability:
			return attack
	return attack_pattern[-1]

func _on_wait_timeout():
	actor.can_attack = true

