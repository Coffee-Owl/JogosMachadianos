extends Node

@export var resources_label : Label
var a = str(PlayerResources.atribute_dic["logica"])

func _process(delta):
	resources_label.text = "Atributos:
	Mentais:
	•Lógica " + str(PlayerResources.atribute_dic["logica"]) + "
	•Conhecimento " + str(PlayerResources.atribute_dic["conhecimento"]) + "
	•Criatividade " + str(PlayerResources.atribute_dic["criatividade"]) + "

	Físicos:
	•Força " + str(PlayerResources.atribute_dic["forca"]) + "
	•Agilidade " + str(PlayerResources.atribute_dic["agilidade"]) + "
	•Resistência " + str(PlayerResources.atribute_dic["resistencia"]) + "

	Sociais:
	•Empatia " + str(PlayerResources.atribute_dic["empatia"]) + "
	•Carisma " + str(PlayerResources.atribute_dic["carisma"]) + "
	•Moral " + str(PlayerResources.atribute_dic["moral"])
