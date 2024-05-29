extends Node
class_name Health

var max_health: int
var armor: int
@export var actor: Actor

@onready var label = $"../Label"

var is_alive: bool = true
var hit_amount: int = 0

signal dead_signal
signal damage_signal

var current_health: int

func _ready():
	max_health = actor.MAX_HEALTH
	current_health = max_health
	armor = actor.ARMOR
	
func _process(_delta):
	if current_health <= 0 and is_alive:
		dead_signal.emit()
		is_alive = false
	
func take_damage(damage: int) -> void:
	if actor.immune:
		return
	if damage > 0:
		damage_signal.emit()
		current_health -= damage
		if current_health < 0:
			current_health = 0
		update_health()

func heal(amount: int) -> void:
	current_health += amount
	if current_health > max_health:
		current_health = max_health

func update_health():
	label.text = str(current_health)

func _on_hurt_box_component_area_entered(area):
	take_damage(area.owner.current_attack["damage"])
