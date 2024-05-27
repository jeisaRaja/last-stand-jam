extends Node
class_name Health

@export var max_health: int = 100
@export var armor: int

@onready var label = $"../Label"

var is_alive: bool = true

signal dead_signal
signal damage_signal

var current_health: int = max_health

func _process(delta):
	if current_health <= 0 and is_alive:
		dead_signal.emit()
		is_alive = false
	
func take_damage(damage: int) -> void:
	damage -= armor
	if damage > 0:
		current_health -= damage
		update_health()
	damage_signal.emit()

func heal(amount: int) -> void:
	current_health += amount
	if current_health > max_health:
		current_health = max_health

func update_health():
	label.text = str(current_health)

func _on_hurt_box_component_area_entered(area):
	take_damage(area.owner.DAMAGE)
