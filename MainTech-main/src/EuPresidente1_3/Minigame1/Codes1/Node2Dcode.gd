extends Node2D

var cont = 0
onready var pontos = 0
export var maxDinheiro = 10
export var tempo = 10 # Estado inicial do timer
var tempo_on = false # Caso esteje funcioanando o timer dessa variavel e igual a true

func _ready():
	$Control/Titulo.visible = false
	$Transicao.emit_signal("START")

func criar_dinheiro(): # Funcao, quando chama cria e instancia o obj Dinheiro apartir da cena Dinheiro.tscn
	var loadDinheiro = preload("res://Minigame1/Cenas1/Dinheiro.tscn")# Carrega a cena Dinheiro.tscn
	var dinheiro = loadDinheiro.instance() # Instancia o obj Dinheiro
	get_parent().add_child(dinheiro) # get_parent(), pega o no pai, nesse caso Node2D. add_child(), é uma funcao que adiciona um obj a cena


func _process(delta):
	if (tempo <= 0):
		tempo_on = false
		$Control/Label.text = "00" + ":" + "00"
		Global.fase = "02"
		Global.gX = 0
		Global.gY = 3
		yield(get_tree().create_timer(0.5),"timeout")
		get_tree().change_scene("res://Telas/main.tscn")
	else:
		if(tempo_on == true):
			if(Global.skinsGames == "vender"):
				$Control/Titulo.visible = false
			tempo -= delta
		$Control/Label.text = "00" + ":" + str(int(tempo))
		$Control/ProgressBar.text = str(pontos)



func _on_Timer_timeout():
	if tempo >= 2.5:
		if(tempo_on == true):
			for i in range (0,2):
				criar_dinheiro()
				i +=1


func _on_Transicao_FIM():
	cont += 1
	if(cont<=2):
		$tutorial_minigame_dinheiro.visible = true
		Global.expandir($tutorial_minigame_dinheiro,5)
	


func _on_tutorialminigamedinheiro_PROXIMO():
	$tutorial_minigame_dinheiro.visible = false
	if(Global.skinsGames == "vender"):
		$Control/Titulo.visible = true
		Global.expandir($Control/Titulo,5)
		yield(get_tree().create_timer(2.5),"timeout")
		tempo_on = true
		$Control/Titulo.visible = false
	else:
		$Control/Titulo.visible = false
		tempo_on = true
	$Control/Timer.start()
