extends Actor
class_name Enemy

@onready var detection_area = $DetectionArea
@onready var raycats = $Raycasts

signal alert_enemy(player: Actor)

var can_attack: bool = true

func _ready():
	super._ready()
	attack_pattern = [
		{"name": "attack", "probability": 0.4, "cooldown": 0.4, "damage": 10},
		{"name": "attack_2", "probability": 0.4, "cooldown": 0.6, "damage": 20},
		{"name": "attack_3", "probability": 0.2, "cooldown": 0.8, "damage": 30}
	]

func _physics_process(_delta):
	move_and_slide()
	
func flip():
	super.flip()
	detection_area.scale.x *= -1
	raycats.scale.x *= -1

func alert(player: Actor):
	alert_enemy.emit(player)
