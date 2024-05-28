extends Node

class_name State

signal change_state(state: State, new_state_name: String)
var actor: Actor = null
var anim: AnimationPlayer = null

func enter():
	pass

func exit():
	pass
	
func update(_delta: float):
	pass

func physics_update(_delta: float):
	pass

func actor_movement():
	if actor.movement_input.x > 0:
		actor.velocity = actor.velocity.move_toward(Vector2(actor.SPEED, actor.velocity.y), 50)
		if actor.facing_dir == -1:
			actor.flip()
		actor.facing_dir = 1
	elif actor.movement_input.x < 0:
		actor.velocity = actor.velocity.move_toward(Vector2(-actor.SPEED, actor.velocity.y), 50)		
		if actor.facing_dir == 1:
			actor.flip()
		actor.facing_dir = -1
	else:
		actor.velocity.x = 0


func _on_health_damage_signal():
	change_state.emit(self,  "TakeDamage")

func _on_health_dead_signal():
	print("enemy death")
	change_state.emit(self, "Death")
