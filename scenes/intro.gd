extends Node2D

signal restrict_control(value:bool)

@onready var king = $King
@onready var guard = $KingGuard
@onready var player = $Player
@onready var start_intro = $StartIntro
@onready var spawn_loc = $SpawnLocation
@onready var spawn_timer = $SpawnTimer

var enemy: PackedScene = preload("res://actors/enemy/enemy.tscn")

var intro_finished = false
var total_enemy_spawned = 0
var remaining_enemies: int

func _ready():
	Dialogic.signal_event.connect(_on_dialogic_signal)

func _on_start_intro_body_entered(body):
	if body.is_in_group("player"):
		Dialogic.start("intro")
		restrict_control.emit(true)
		start_intro.queue_free()
		
func _on_dialogic_signal(arg: String):
	if arg == "intro_finished":
		player.can_move = true
		king.movement_input.x = -1
		guard.movement_input.x = -1
		intro_finished = true
		set_spawn_enemy(3)

func set_spawn_enemy(amount: int):
	remaining_enemies = amount
	if remaining_enemies > 0:
		spawn_enemy()
		remaining_enemies -= 1
		spawn_timer.start(1.5)

func spawn_enemy():
	var enemy_spawn: Actor = enemy.instantiate()
	add_child(enemy_spawn)
	enemy_spawn.position = spawn_loc.position

func _on_spawn_timer_timeout():
	if remaining_enemies > 0:
		spawn_enemy()
		remaining_enemies -= 1
		if remaining_enemies == 0:
			spawn_timer.stop()  # Stop the timer if all enemies have been spawned
		else:
			spawn_timer.start(2)  # Restart the timer for the next enemy spawn
