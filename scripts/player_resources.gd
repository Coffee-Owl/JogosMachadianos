extends Node

var player_name = ""
var profession = ""
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

func _ready():
	Dialogic.signal_event.connect(rollDice)
	Dialogic.signal_event.connect(changeAtribute)
	Dialogic.signal_event.connect(changePlayerName)
	Dialogic.signal_event.connect(changePlayerProfession)
	
func rollDice(command):
	var trigger = command.get_slice(" ", 0)
	var atribute_in_use = command.get_slice(" ", 1)
	if trigger == "roll":
		var dice_value = 1 + (randi()%6)
		for atribute in atribute_dic.keys():
			if atribute_in_use == atribute:
				dice_value += atribute_dic[atribute]
				Dialogic.VAR.dice_value = dice_value
				print("rolou " + atribute_in_use + " e conseguiu " + str(dice_value))
			
func changeAtribute(command):
	var trigger = command.get_slice(" ", 0)
	var atribute_in_use = command.get_slice(" ", 1)
	var ammount_to_change = command.get_slice(" ", 2)
	if trigger == "increase_att":
		for atribute in atribute_dic.keys():
			if atribute_in_use == atribute:
				atribute_dic[atribute] =+ int(ammount_to_change)
	elif trigger == "decrease_att":
		for atribute in atribute_dic.keys():
			if atribute_in_use == atribute:
				atribute_dic[atribute] =- int(ammount_to_change)
				
func changePlayerName(command):
	var trigger = command.get_slice(" ", 0)
	if trigger == "change_name":
		player_name = Dialogic.VAR.player_name

func changePlayerProfession(command):
	var trigger = command.get_slice(" ", 0)
	if trigger == "change_profession":
		profession = Dialogic.VAR.player_profession


