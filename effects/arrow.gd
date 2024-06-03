extends Area2D

@export var arrow_speed: int
@export var max_distance: int

var start_position: Vector2 
var direction: Vector2 = Vector2.RIGHT

func _ready():
	pass

func _process(_delta):
	pass

func _physics_process(delta):
	position += direction * arrow_speed * delta
	if position.x - start_position.x > max_distance:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("player"):
		print("player got hit by arrow")
