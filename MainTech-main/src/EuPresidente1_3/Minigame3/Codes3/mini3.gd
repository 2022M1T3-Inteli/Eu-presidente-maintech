extends Node2D
var novoBloco
var textura = 0
func criar_bloco(textura): #Função criada para criar novos blocos quando chamada.
		novoBloco = preload("res://Minigame3/Cenas3/bloco.tscn").instance()
		get_parent().add_child(novoBloco)
		novoBloco.frames = textura
func _ready():
	$Transicao.emit_signal("START")
	$tutorial_minigame_construcao.visible = false
	Global.pontuacao = 0

func _on_sensor_body_entered(body): #Se o bloco passar por essa area2d, então a funcão criar_bloco() é chamada.
	criar_bloco(textura)
	Global.pontuacao += 1
	$Camera.position.y -= 20
	novoBloco.position.y -= (Global.pontuacao*3)

func _on_sensor2_body_entered(body): #Se o bloco passar por essa area2d, então o jogo é finalizado e cena de fim é chamada.
	$'.'.get_tree().paused = true
	Global.final3 = 1
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://finais/FinalFim.tscn")

func _process(delta):
	if Global.pontuacao == 7:
		Global.final3 = 1
		yield(get_tree().create_timer(1),"timeout")
		get_tree().change_scene("res://finais/FinalFim.tscn")
	if Global.pontuacao < 5:
		textura = 1

	if Global.pontuacao == 5:
		textura = 2

func _on_Transicao_FIM():
	$tutorial_minigame_construcao.visible = true
	Global.expandir($tutorial_minigame_construcao,5)



func _on_tutorialminigameconstrucao_PROXIMO():
	$tutorial_minigame_construcao.visible = false
	
