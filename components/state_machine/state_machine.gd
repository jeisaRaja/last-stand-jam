extends Node

@export var initial_state: State

var current_state
var states: Dictionary = {}

func _ready():
	pass

func _physics_process(delta):
	if current_state: current_state.Update(delta)
