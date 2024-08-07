extends Node2D

@export var dialog_to_start := "timeline desejada"
@export var next_scene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start(dialog_to_start)
	Dialogic.timeline_ended.connect(ended)

func ended():
	get_tree().change_scene_to_packed(next_scene)
