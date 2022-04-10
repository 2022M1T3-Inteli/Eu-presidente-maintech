extends Node2D

var timerColetavel = 0
var timerObstaculo = 0
var velocidade = 1
var aceleracao = 1
var jogoON = false
var comeco = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$"tutorial-minigame-corrida".visible = false
	$Transicao.emit_signal("START")
	$player.position.x = 512
	$player.position.y = 400
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if (jogoON == true):
		if(Global.pontuacao <= 5):
			Global.velocidade = 6
		elif (Global.pontuacao > 5 and Global.pontuacao <=9):
			Global.velocidade = 8
		elif (Global.pontuacao > 9 and Global.pontuacao <=15):
			Global.velocidade = 12
		timerColetavel += delta
		timerObstaculo += delta
		if timerObstaculo >= 1.5:
			criar_obstaculo()
			timerObstaculo = 0
		if timerColetavel >= 2:
			criar_coletavel()
			timerColetavel = 0
		$pontuacao.text = "PONTOS: " + str(Global.pontuacao)
		if Global.gameover:
			gameover()
		if(Global.pontuacao >= 15 ):
			gameover()
		



func criar_coletavel():
	var loadColetavel = preload("res://Obj/coletavel.tscn")# Carrega a cena do coletavel
	var coletavel = loadColetavel.instance() # Instancia o objeto coletavel
	get_parent().add_child(coletavel) # adiciona um objeto de coletavel a cena
	
func criar_obstaculo():
	var loadObstaculo = preload("res://Obj/obstaculo.tscn") # Carrega a cena do coletavel
	var obstaculo = loadObstaculo.instance() # Instancia o objeto coletavel
	get_parent().add_child(obstaculo) # adiciona um objeto de coletavel a cena

func gameover():
	jogoON = false
	$gameover.visible = true
	Global.gY = 0
	Global.gX = 6
	Global.fase = "03"
	remove_child($player)
	remove_child($obstaculo)
	remove_child($background)
	get_tree().change_scene("res://Telas/main.tscn")
	
	


func _on_Transicao_FIM():
	$"tutorial-minigame-corrida".visible = true
	Global.expandir($"tutorial-minigame-corrida",5)
	


func _on_tutorialminigamecorrida_PROXIMO():
	$"tutorial-minigame-corrida".visible = false
	jogoON = true
	
	
