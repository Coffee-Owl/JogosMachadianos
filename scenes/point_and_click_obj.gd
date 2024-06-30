extends Sprite2D

@export var areaDisplay : Sprite2D
@export var nextScene : PackedScene
var defaultColor := Color(255 / 255, 255 / 255, 255 / 255, 255 / 255)
var hoverColor := Color(0.8, 0, 0, 220)
var mouseInArea := false


func _ready():
	areaDisplay.modulate = defaultColor


func _on_area_2d_mouse_entered():
	areaDisplay.modulate = hoverColor
	mouseInArea = true


func _on_area_2d_mouse_exited():
	areaDisplay.modulate = defaultColor
	mouseInArea = false


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("mouse_left") and mouseInArea:
		get_tree().change_scene_to_packed(nextScene)
