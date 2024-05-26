extends Node
class_name MovementInput

@export var Actor: CharacterBody2D		## Parent node that does the movement

## Input variable
var movement_input = Vector2.ZERO
var jump_input: bool = false
var jump_input_actuation: bool = false
var climb_input: bool = false
var dash_input: bool = false
var attack_input: bool = false

## Mechanics
var can_dash: bool = true
var can_coyote: bool = false
var was_on_floor: bool = true
var is_jumping: bool = false
var dash_cooldown: float = 1
var jump_count: int = 0
var max_jump_count: int = 2
var facing_dir: int = 1

func player_input():
	movement_input = Vector2.ZERO
	if Input.is_action_pressed("MoveRight"):
		movement_input.x = 1
	if Input.is_action_pressed("MoveLeft"):
		movement_input.x = -1
	if Input.is_action_pressed("MoveUp"):
		movement_input.y = -1
	if Input.is_action_pressed("MoveDown"):
		movement_input.y = 1
	if Input.is_action_pressed("Jump"):
		jump_input = true
	else:
		jump_input = false
	
	if Input.is_action_just_pressed("Jump"):
		jump_input_actuation = true
	else:
		jump_input_actuation = false
	
	if Input.is_action_just_pressed("Dash"):
		dash_input = true
	else:
		dash_input = false
	
	if Input.is_action_just_pressed("Attack"):
		attack_input = true
	else:
		attack_input = false

