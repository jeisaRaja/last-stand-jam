extends Actor
class_name Player

@onready var health_component = $Health

func _physics_process(delta):
	player_input()
	move_and_slide()

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


