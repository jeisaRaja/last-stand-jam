extends Actor
class_name Enemy

@onready var detection_area = $DetectionArea
@onready var raycasts = $Raycasts

signal alert_enemy(player: Actor)

var can_attack: bool = true

func _ready():
	super._ready()

func _physics_process(_delta):
	super._physics_process(_delta)
	
func flip():
	super.flip()
	if detection_area:
		detection_area.scale.x *= -1
	if raycasts:
		raycasts.scale.x *= -1

func alert(player: Actor):
	alert_enemy.emit(player)
