extends Actor
class_name Enemy

@onready var detection_area = $DetectionArea
@onready var raycats = $Raycasts

signal alert_enemy(player: Actor)

var can_attack: bool = true

func _ready():
	super._ready()

func _physics_process(_delta):
	super._physics_process(_delta)
	
func flip():
	super.flip()
	detection_area.scale.x *= -1
	raycats.scale.x *= -1

func alert(player: Actor):
	alert_enemy.emit(player)
