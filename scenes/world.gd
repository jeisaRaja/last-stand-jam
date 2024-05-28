extends Node2D

func _on_player_dead_signal():
	get_tree().reload_current_scene()
