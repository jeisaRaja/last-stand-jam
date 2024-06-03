extends EnemeyWithControl
class_name Ranger

var arrow: PackedScene = preload("res://effects/arrow.tscn")
var attack_count: int = 0
var attack_timer: Timer = null

func _ready():
	super._ready()
	attack_pattern = [
		{"name": "attack", "damage": 10, "range": 300}
	]

func _physics_process(_delta):
	super._physics_process(_delta)
	target_position = player.global_position.x
	var distance_to_target = abs(global_position.x - target_position)
	if player and can_attack:
		current_attack = attack_pattern[attack_count]
		if distance_to_target < current_attack["range"]:
			attack()
			can_attack = false
			var timer: Timer = Timer.new()
			add_child(timer)
			timer.one_shot = true
			timer.autostart = false
			timer.wait_time = 0.8
			timer.timeout.connect(_immune_timer_timeout)
			add_child(timer)
			timer.start()
			attack_timer = timer

func flip():
	super.flip()
	detection_area.scale.x *= -1

func alert(player: Actor):
	alert_enemy.emit(player)

func _on_attack_attack_finished():
	print("attack finished")
	can_attack = true

func _immune_timer_timeout():
	attack_timer.queue_free()
	var arrow_instance = arrow.instantiate()
	add_child(arrow_instance)
	arrow_instance.global_position = $Marker2D.global_position
