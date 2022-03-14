extends Node2D
# nada nesse script funciona. Help.
onready var blocoload 
onready var bloco 

func criaBloco():
	blocoload = preload("res://Bloco.tscn")
	bloco = blocoload.instance()
	get_parent().add_child(bloco)


func _ready():
	criaBloco()
	pass # Replace with function body.

func _process(delta):
	#print(Global.botao)
	if Global.baixo == true:
		print("entrou")
		criaBloco()
		Global.baixo = false

func _on_Button_pressed():
	bloco.lateral = false
	bloco.caindo = true
	pass # Replace with function body.
