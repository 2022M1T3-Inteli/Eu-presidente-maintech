extends Node

var velocidade = 6
var pontuacao = 0
var gameover = false
var gX = 0
var gY = 0
var skinsGames = ""
var fase = ""
var personagem = 0
var nomePessoa = ""
var apCongreco = 0
var apPopulacao = 0
var timerInve = 0 
var sprite = ""
var final3 = 0
var musica = true
var som = true
var contador = 1
var Coluna = 0
var Linha = 0

func expandir (obj,vezes):
	
	obj.scale = Vector2(0.25,0.25)
	for i in vezes:
		obj.scale = Vector2(0.25*i,0.25*i)
		i += 1
		yield(get_tree().create_timer(0,25),"timeout")
