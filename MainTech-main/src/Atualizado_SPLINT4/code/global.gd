extends Node

var velocidade = 6
var pontuacao = 0
var gameover = false
var gX = 0
var gY = 0
var skinsGames = "floresta"
var fase = ""
var personagem = 0
var nomePessoa = ""
var apCongreco = 80
var apPopulacao = 60
var timerInve = 0 
var sprite = ""


func expandir (obj):
	obj.scale = Vector2(0.25,0.25)
	for i in 5:
		obj.scale = Vector2(0.25*i,0.25*i)
		i += 1
		yield(get_tree().create_timer(0,25),"timeout")
