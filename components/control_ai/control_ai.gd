extends Node

@export var actor: Actor
@export var SPEED: int
@export var attack_range: int 

var player: Actor = null
var chase_player: bool = false

func _physics_process(delta):
	enemy_input()

func _on_detection_area_body_entered(body):
	if body.name.to_lower() == "player":
		player = body
		chase_player = true

func _on_detection_area_body_exited(body):
	chase_player = false
	player = null
	actor.attack_input = false
	
func enemy_input():
	actor.movement_input = Vector2.ZERO
	if chase_player:
		var distance_to_player = abs(player.position.x - actor.position.x)
		if distance_to_player > attack_range:
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
				actor.attack_input = true

