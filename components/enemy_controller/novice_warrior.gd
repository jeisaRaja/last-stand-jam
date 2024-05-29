extends ControlClass
class_name NoviceWarriorController

var wander_radius: int = 100

func _ready():
	wander_center = enemy.global_position.x
	
func _process(_delta):
	pass

func _physics_process(_delta):
	if player == null and not is_wandering:
		is_wandering = true
		wander_target = wander_around(wander_radius)
	if abs(enemy.global_position.x - wander_target) < 1:
		wander_target = wander_around(wander_radius)
