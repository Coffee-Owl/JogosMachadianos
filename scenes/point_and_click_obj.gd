extends Sprite2D

@export var areaDisplay : Sprite2D
@export var nextScene : PackedScene
var defaultColor := Color(255 / 255, 255 / 255, 255 / 255, 255 / 255)
var hoverColor := Color(0.8, 0, 0, 220)
var mouseInArea := false

func _ready():
	areaDisplay.modulate = defaultColor

func _on_area_2d_mouse_entered():
	print ("entrou")
	areaDisplay.modulate = hoverColor
	mouseInArea = true


func _on_area_2d_mouse_exited():
	print ("saiu")
	areaDisplay.modulate = defaultColor
	mouseInArea = false
