extends Actor
class_name Enemy

@onready var detection_area = $DetectionArea
@onready var raycats = $Raycasts

signal alert_enemy(player: Actor)

func _ready():
	super._ready()
	attack_pattern = [
		{"name": "attack", "probability": 0.5, "cooldown": 0, "damage": 10},
		{"name": "attack_2", "probability": 0.4, "cooldown": 0, "damage": 20},
		{"name": "attack_3", "probability": 0.1, "cooldown": 0, "damage": 40}
	]

func _physics_process(_delta):
	move_and_slide()
	
func flip():
	sprite.flip_h = not sprite.flip_h
	hitbox.scale.x *= -1
	detection_area.scale.x *= -1
	raycats.scale.x *= -1

func alert(player: Actor):
	alert_enemy.emit(player)
