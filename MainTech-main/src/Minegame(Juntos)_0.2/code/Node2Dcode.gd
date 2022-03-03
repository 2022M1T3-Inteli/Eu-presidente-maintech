extends Node2D

onready var pontos = 0
var maxDinheiro = 0

func criar_dinheiro(): # Funcao, quando chama cria e instancia o obj Dinheiro apartir da cena Dinheiro.tscn
	var loadDinheiro = preload("res://Obj/Dinheiro.tscn") # Carrega a cena Dinheiro.tscn
	var dinheiro = loadDinheiro.instance() # Instancia o obj Dinheiro
	get_parent().add_child(dinheiro) # get_parent(), pega o no pai, nesse caso Node2D. add_child(), é uma funcao que adiciona um obj a cena

func _process(delta):
	$Control/ProgressBar.max_value = maxDinheiro
	$Control/ProgressBar.value = pontos
	print("Pontos: ",pontos," Maximo de Pontos: ",maxDinheiro )
	



func _on_Voltar_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_Button_pressed():
	maxDinheiro += 1
	criar_dinheiro()
