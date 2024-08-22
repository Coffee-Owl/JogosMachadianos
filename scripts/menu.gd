extends Node

@export var next_scene : PackedScene

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			get_tree().change_scene_to_packed(next_scene)
