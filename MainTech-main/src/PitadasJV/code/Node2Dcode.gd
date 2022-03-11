extends Node2D

var fim = false
onready var pontos = 0
export var maxDinheiro = 78
func _ready():
	$Control/Timer.start()

func criar_dinheiro(): # Funcao, quando chama cria e instancia o obj Dinheiro apartir da cena Dinheiro.tscn
	var loadDinheiro = preload("res://Obj/Dinheiro.tscn")# Carrega a cena Dinheiro.tscn
	var dinheiro = loadDinheiro.instance() # Instancia o obj Dinheiro
	get_parent().add_child(dinheiro) # get_parent(), pega o no pai, nesse caso Node2D. add_child(), é uma funcao que adiciona um obj a cena
		
	
func _process(delta):
	if ($Control/Label.acabou == false):
		$Control/ProgressBar.max_value = maxDinheiro
		$Control/ProgressBar.value = pontos
		print("Pontos: ",pontos," Maximo de Pontos: ",maxDinheiro )
	else:
		if(fim == false):
			var loadLimpador = preload("res://Obj/Limpador.tscn")
			var limpador = loadLimpador.instance()
			get_parent().add_child(limpador)
			fim = true
		else:
			yield(get_tree().create_timer(1),"timeout")
			get_tree().change_scene("res://Telas/main.tscn")



func _on_Timer_timeout():
	for i in range (0,2):
		if (fim == false):
			criar_dinheiro()
		i +=1
