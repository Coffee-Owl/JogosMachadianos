extends Node2D

@export var dialog_to_start := "timeline desejada"
var scene_to_change
@export var scene1 : PackedScene
@export var scene2 : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.start(dialog_to_start)
	Dialogic.signal_event.connect(proxCena)
	Dialogic.timeline_ended.connect(ended)

func proxCena(cena):
	if cena == "proximaCena0":
		scene_to_change = scene1
	else:
		scene_to_change = scene2

func ended():
	get_tree().change_scene_to_packed(scene_to_change)
