extends Node2D

var timerColetavel = 0
var timerObstaculo = 0
var velocidade = 1
var aceleracao = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	$player.position.x = 512
	$player.position.y = 400
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
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


func criar_coletavel():
	var loadColetavel = preload("res://coletavel.tscn")# Carrega a cena do coletavel
	var coletavel = loadColetavel.instance() # Instancia o objeto coletavel
	get_parent().add_child(coletavel) # adiciona um objeto de coletavel a cena
	
func criar_obstaculo():
	var loadObstaculo = preload("res://obstaculo.tscn") # Carrega a cena do coletavel
	var obstaculo = loadObstaculo.instance() # Instancia o objeto coletavel
	get_parent().add_child(obstaculo) # adiciona um objeto de coletavel a cena

func gameover():
	$gameover.visible = true
