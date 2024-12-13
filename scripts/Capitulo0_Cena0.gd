extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var random_i = randi() % 3
	
	match random_i:
		0:
			Dialogic.VAR.nome_livro = "Memórias póstumas de Brás Cobras"
		1:
			Dialogic.VAR.nome_livro = "Dom Cãosmurro"
		2:
			Dialogic.VAR.nome_livro = "Quincas Burro"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
