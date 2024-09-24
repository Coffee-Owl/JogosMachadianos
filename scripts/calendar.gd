extends Node2D

@export var selected_day : Sprite2D
@export var day_label : Label

var time = 0
var current_day = 1
var continue_time = true

func printDay(day_num):
	match(day_num):
		0:
			day_label.text = "Dia: Domingo"
		1:
			day_label.text = "Dia: Segunda"
		2:
			day_label.text = "Dia: Terça"
		3:
			day_label.text = "Dia: Quarta"
		4:
			day_label.text = "Dia: Quinta"
		5:
			day_label.text = "Dia: Sexta"
		6:
			day_label.text = "Dia: Sábado"

func _ready():
	var menu_button_trabalhos = $MenuButtonTrabalhos
	var popup = menu_button_trabalhos.get_popup()
	popup.id_pressed.connect(menuTrabalhos)

func menuTrabalhos(id):
	match(id):
		0:
			print("verde")
		1:
			print("azul")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	printDay(current_day)
	
	if continue_time:
		time += delta
	if time > 1:
		current_day+= 1;
		selected_day.offset += Vector2(50,0)
		if selected_day.offset.x >= 350:
			selected_day.offset += Vector2(-350,50)
		if current_day == 7:
			current_day = 0
			continue_time = false
		time = 0

func _on_continue_button_pressed():
	continue_time = true
