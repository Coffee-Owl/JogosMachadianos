extends Node

var atribute_dic = {
	"logica" : 0,
 	"conhecimento" : 0,
 	"criatividade" : 0,
	"forca" : 0,
	"agilidade" : 0,
	"resistencia" : 0,
	"empatia" : 0,
	"carisma" : 0,
	"moral" : 0,
}
var dice_value : int

func _ready():
	Dialogic.signal_event.connect(rollDice)

func rollDice(atribute_in_use):
	dice_value = 1 + (randi()%20)
	for atribute in atribute_dic.keys():
		if atribute_in_use == atribute:
			dice_value += atribute_dic[atribute]
