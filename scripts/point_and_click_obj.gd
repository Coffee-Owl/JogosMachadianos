extends Sprite2D

@export var area_display : Sprite2D
@export var next_scene : PackedScene
var default_color := Color(1, 1, 1, 1)
var hover_color := Color(0.8, 0, 0, 0.8)
var mouse_in_area := false

func _ready():
	area_display.modulate = default_color


func _on_area_2d_mouse_entered():
	area_display.modulate = hover_color
	mouse_in_area = true


func _on_area_2d_mouse_exited():
	area_display.modulate = default_color
	mouse_in_area = false


func _on_area_2d_input_event(_viewport, event, _shape_idx):
	if event.is_action_pressed("mouse_left") and mouse_in_area:
		get_tree().change_scene_to_packed(next_scene)
