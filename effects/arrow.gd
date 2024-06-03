extends Area2D

@export var arrow_speed: int
@export var max_distance: int
@export var arrow_spawn: Marker2D

var start_position: Vector2 
var direction: Vector2 = Vector2.RIGHT

func _ready():
	start_position= owner.global_position

func _process(_delta):
	pass

func _physics_process(delta):
	position += direction * arrow_speed * delta
	if position.x - start_position.x > max_distance:
		queue_free()

