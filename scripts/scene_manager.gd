extends Node

#script usado para mudar de cenas quando não feito pelo signal de finalização de cena do godot

func _unhandled_input(event):
	var current_scene_name = get_tree().current_scene.name
	if event is InputEventKey:
		if event.pressed:
			if current_scene_name == "TelaDeInicio":
				get_tree().change_scene_to_file("res://scenes/Capitulo0_Cena0.tscn")
			if current_scene_name == "FimDaBeta":
				get_tree().change_scene_to_file("res://scenes/TelaDeInicio.tscn")
