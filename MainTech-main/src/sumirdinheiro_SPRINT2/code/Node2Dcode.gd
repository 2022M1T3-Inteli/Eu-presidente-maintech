extends Node2D

onready var pontos = 0
export var maxDinheiro = 78
func _ready():
	$Control/Timer.start()

func criar_dinheiro(): # Funcao, quando chama cria e instancia o obj Dinheiro apartir da cena Dinheiro.tscn
	var loadDinheiro = preload("res://Obj/Dinheiro.tscn")# Carrega a cena Dinheiro.tscn
	var dinheiro = loadDinheiro.instance() # Instancia o obj Dinheiro
	get_parent().add_child(dinheiro) # get_parent(), pega o no pai, nesse caso Node2D. add_child(), é uma funcao que adiciona um obj a cena
		
	
func _process(delta):	if ($Control/Label.tempo <= 0):
	$Control/ProgressBar.max_value = maxDinheiro
	$Control/ProgressBar.value = pontos
	print("Pontos: ",pontos," Maximo de Pontos: ",maxDinheiro )
	



func _on_Timer_timeout():
	if $Control/Label.tempo >= 2.5:
		for i in range (0,4):
			criar_dinheiro()
			print("criou")
			i +=1
