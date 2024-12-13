extends Control

@onready var day_label = $LabelDia
@onready var week_label = $LabelSemana
@onready var month_label = $LabelMes

func _on_calendario_day_changed(current_day):
	match(current_day):
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


func _on_calendario_week_changed(current_week):
	week_label.text = "Semana: " + str(current_week)
