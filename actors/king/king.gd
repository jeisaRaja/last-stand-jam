extends Actor
class_name King

func _ready():
	super._ready()

func _physics_process(_delta):
	move_and_slide()
	
func flip():
	super.flip()

