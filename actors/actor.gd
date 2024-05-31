extends CharacterBody2D
class_name Actor

@onready var state_machine = $StateMachine
@onready var animation_player = $AnimationPlayer
@onready var gravity = $GravityComponent
@onready var sprite = $Sprite2D
@onready var hitbox = $HitboxComponent

@export var BASE_SPEED: int
@export var JUMP_VELOCITY = -300.0
@export var DAMAGE: int
@export var MAX_HEALTH: int
@export var ARMOR: int
@onready var SPEED = BASE_SPEED

var movement_input = Vector2.ZERO
var jump_input: bool = false
var jump_input_actuation: bool = false
var climb_input: bool = false
var dash_input: bool = false
var attack_input: bool = false
var attack_input_1: bool = false
var attack_input_2: bool = false
var attack_input_3: bool = false
var attack_input_4: bool = false

var block_input: bool = false

var can_dash: bool = true
var can_coyote: bool = false
var was_on_floor: bool = true
var is_jumping: bool = false
var dash_cooldown: float = 1
var jump_count: int = 0
var max_jump_count: int = 2
var facing_dir: int = 1

var current_attack = null
var attack_pattern = []
var immune: bool = false

func _ready():
	for state in state_machine.get_children():
		if state is State:
			state.actor = self
			state.anim = animation_player
	state_machine.initiate_states_machine()

func _physics_process(delta):
	move_and_slide()

func flip():
	sprite.flip_h = not sprite.flip_h

