extends Node2D

@onready var cidade = $Cidade
@onready var quarto = $Quarto
@onready var ruaNoite = $RuaNoite
@onready var vendinha = $Vendinha
@onready var armazem = $Armazem
@onready var bar = $Bar

# Called when the node enters the scene tree for the first time.
func _ready():
	Dialogic.signal_event.connect(mudarBG)


func mudarBG(comando):
	var trigger = comando.get_slice(" ", 0)
	var bgParaMudar = comando.get_slice(" ", 1)
	
	if trigger == "mudarBG":
		cidade.visible = false;
		quarto.visible = false;
		ruaNoite.visible = false;
		vendinha.visible = false;
		armazem.visible = false;
		bar.visible = false;
		if bgParaMudar == "cidade":
			cidade.visible = true;
		if bgParaMudar == "quarto":
			quarto.visible = true;
		if bgParaMudar == "ruaNoite":
			ruaNoite.visible = true;
		if bgParaMudar == "vendinha":
			vendinha.visible = true;
		if bgParaMudar == "armazem":
			armazem.visible = true;
		if bgParaMudar == "bar":
			bar.visible = true;

