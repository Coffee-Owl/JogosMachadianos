extends Node

@export var logicaBG : Sprite2D
@export var logicaLB : Label

func _on_area_2d_0_mouse_entered():
	logicaBG.visible = true
	logicaLB.visible = true


func _on_area_2d_0_mouse_exited():
	logicaBG.visible = false
	logicaLB.visible = false
	
