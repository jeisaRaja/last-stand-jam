extends Node2D

signal restrict_control(value:bool)

@onready var king = $King
@onready var guard = $KingGuard
@onready var player = $Player
@onready var start_intro = $StartIntro

var intro_finished = false

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
