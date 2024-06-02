extends Actor
class_name Player

@onready var health_component = $Health

signal dead_signal

var can_move = true

func _ready():
	super._ready()
	attack_pattern = [
		{"name": "attack", "probability": 1, "cooldown": 0, "damage": 10},
		{"name": "attack_2", "probability": 1, "cooldown": 0, "damage": 15},
	]

func _process(_delta):
	if health_component.current_health <= 0:
		dead_signal.emit()

func _physics_process(_delta):
	player_input()
	super._physics_process(_delta)
	
func player_input():
	if not can_move:
		return
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
	
	if Input.is_action_just_pressed("Dash") and can_dash:
		dash_input = true
	else:
		dash_input = false
	
	if Input.is_action_just_pressed("Attack"):
		attack_input = true
	else:
		attack_input = false

	if Input.is_action_just_pressed("Block"):
		block_input = true
	else:
		block_input = false


func _on_intro_restrict_control(value: bool):
	can_move = not value
	set_all_input_to_zero()

func set_all_input_to_zero():
	movement_input.x = 0
	movement_input.y = 0
	attack_input = false
	block_input = false
	dash_input = false
	jump_input = false
	jump_input_actuation = false

func flip():
	super.flip()
	hitbox.scale.x *= -1
