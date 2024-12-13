extends Node2D

signal day_changed(current_day)
signal week_changed(current_week)

@export var selected_day : Sprite2D
@export var day_label : Label

var trabalho_verde = preload("res://objects/trabalho_verde.tscn")
var trabalho_azul = preload("res://objects/trabalho_azul.tscn")

var time = 0
var current_day = 1
var current_week = 1
var current_month = 0
var continue_time = false
var instantiated_object
var object_is_instantiated = false
var tasks_matrix = [["empty","empty"],["empty","empty"],["empty","empty"],["empty","empty"]]
var current_line_g = 0
var current_column_g = 0
var current_task = "empty"
#used to only trigger the tasks bonus once
var tuesday_checked = false
var friday_checked = false
 
func instantiateObject(scene_to_instantiate : PackedScene):
	var object = scene_to_instantiate.instantiate()
	add_child(object)
	instantiated_object = object
	object_is_instantiated = true

func _ready():
	var menu_button_trabalhos = $MenuButtonTrabalhos
	var popup = menu_button_trabalhos.get_popup()
	popup.id_pressed.connect(menuTrabalhos)

func menuTrabalhos(id):
	if continue_time == false:
		match(id):
			0:
				instantiateObject(trabalho_verde)
				instantiated_object.position = Vector2(425,268)
				current_task = "green"
			1:
				instantiateObject(trabalho_azul)
				instantiated_object.position = Vector2(425,268)
				current_task = "blue"

func nextMonth():
	print("passou o mes")
	current_month += 1
	current_day = 0
	current_week = 1
	emit_signal("week_changed",current_week)
	selected_day.offset += Vector2(-300,-150)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if continue_time:
		time += delta
	if time > 1:
		current_day+= 1
		selected_day.offset += Vector2(50,0)
		if selected_day.offset.x >= 350:
			selected_day.offset += Vector2(-350,50)
		if current_day == 7:
			current_day = 0
			continue_time = false
			
			current_week+= 1
			emit_signal("week_changed",current_week)
			
			tuesday_checked = false
			friday_checked = false
		time = 0
		emit_signal("day_changed",current_day)
	if current_day == 3 and tuesday_checked == false:
		tuesday_checked = true
		print(tasks_matrix[current_week-1][0])
	if current_day == 6 and friday_checked == false:
		friday_checked = true
		print(tasks_matrix[current_week-1][1])

func _on_continue_button_pressed():
	if current_week == 5:
		nextMonth()
	continue_time = true

func _input(event):
	if event.is_action_pressed("mouse_left"):
		if object_is_instantiated:
			object_is_instantiated = false
			tasks_matrix[current_line_g][current_column_g] = current_task
			print(tasks_matrix)

func area_management(area_cords : Vector2, current_line : int, current_column : int):
	if object_is_instantiated:
		instantiated_object.position = area_cords
		current_line_g = current_line
		current_column_g = current_column

func _on_area_2d_00_mouse_entered():
	area_management(Vector2(425,268), 0, 0)

func _on_area_2d_10_mouse_entered():
	area_management(Vector2(425,318), 1, 0)

func _on_area_2d_20_mouse_entered():
	area_management(Vector2(425,368), 2, 0)

func _on_area_2d_30_mouse_entered():
	area_management(Vector2(425,418), 3, 0)

func _on_area_2d_01_mouse_entered():
	area_management(Vector2(575,268), 0, 1)

func _on_area_2d_11_mouse_entered():
	area_management(Vector2(575,318), 1, 1)

func _on_area_2d_21_mouse_entered():
	area_management(Vector2(575,368), 2, 1)

func _on_area_2d_31_mouse_entered():
	area_management(Vector2(575,418), 3, 1)
