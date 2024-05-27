extends Node
class_name StateMachine

@export var initial_state: State

var current_state
var states: Dictionary = {}

func _ready():
	pass

func _process(delta):
	if current_state: current_state.update(delta)

func _physics_process(delta):
	if current_state: current_state.physics_update(delta)
	
func on_child_transition(state: State, new_state_name: String):
	if state != current_state:
		return 
	if current_state:
		current_state.exit()
	var new_state = states.get(new_state_name.to_lower())
	new_state.enter()
	current_state = new_state
	#current_state_name = newStateName

func initiate_states_machine():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.change_state.connect(on_child_transition)
	if initial_state:
		initial_state.enter()
		current_state = initial_state

#func get_current_state_name():
	#return current_state_name
