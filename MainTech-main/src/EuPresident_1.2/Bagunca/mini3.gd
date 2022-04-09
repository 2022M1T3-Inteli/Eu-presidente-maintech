extends Node2D
var novobloco
var a = 0
var b = 0
var c = 0
func criar_bloco(a): #Função criada para criar novos blocos quando chamada.
		novobloco = preload("res://Bagunca/bloco.tscn").instance()
		get_parent().add_child(novobloco)
		novobloco.frames = a
		#b = novobloco.CSX
		#c = novobloco.CSY
func _ready():
	$Transicao.emit_signal("START")
	$tutorial_minigame_construcao.visible = false
	Global.pontuacao = 0
	print("ready")
	#print("Savlv",novobloco.position)

func _on_sensor_body_entered(body): #Se o bloco passar por essa area2d, então a funcão criar_bloco() é chamada.
	criar_bloco(a)
	Global.pontuacao += 1
	#$sensor/CollisionShape2D.position.y -= 50
	$Camera.position.y -= 20
	novobloco.position.y -= (Global.pontuacao*3)
	print("collidiu")

func _on_sensor2_body_entered(body): #Se o bloco passar por essa area2d, então o jogo é finalizado e cena de fim é chamada.
	$'.'.get_tree().paused = true
	Global.fase = ""
	Global.final3 = 1
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://Telas/main.tscn")

func _process(delta):
	if Global.pontuacao == 7:
		#$'.'.get_tree().paused = true
		Global.fase = ""
		Global.final3 = 1
		yield(get_tree().create_timer(1),"timeout")
		get_tree().change_scene("res://Telas/main.tscn")
	print(novobloco)
	#if Global.pontuacao == 0:
	#	print("baixo")
	#	a = 0
		#b = 0.97
		#c = 0.70
	if Global.pontuacao < 5:
		print("meio")
		a = 1
		#b = 1.03
		#c = 1.20
	if Global.pontuacao == 5:
		print("topo")
		a = 2
		#b = 1.00
		#c = 1.00


func _on_Transicao_FIM():
	$tutorial_minigame_construcao.visible = true
	Global.expandir($tutorial_minigame_construcao,5)



func _on_tutorialminigameconstrucao_PROXIMO():
	$tutorial_minigame_construcao.visible = false
	
