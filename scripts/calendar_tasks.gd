extends Node2D
@onready var green_task00 = $TrabalhoVerde00

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	wait(1)
	green_task00.set_visible(false)

func _on_area_2d_mouse_exited():
	wait(1)
	green_task00.set_visible(true)
