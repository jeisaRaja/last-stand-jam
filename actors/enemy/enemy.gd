extends Actor
class_name Enemy

@onready var detection_area = $DetectionArea
@onready var raycats = $Raycasts

func _physics_process(delta):
	move_and_slide()
	
func flip():
	sprite.flip_h = not sprite.flip_h
	hitbox.scale.x *= -1
	detection_area.scale.x *= -1
	raycats.scale.x *= -1
