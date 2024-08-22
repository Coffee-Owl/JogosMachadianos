extends Node

signal name_input

func _on_line_edit_text_submitted(player_name):
	if player_name == "":
		emit_signal("name_input", "Galvão")
	else:
		emit_signal("name_input", player_name)
