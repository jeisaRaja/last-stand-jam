extends Node

@export var actor: CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func apply_gravity(delta: float):
	if not actor.is_on_floor():
		actor.velocity.y += gravity * delta

