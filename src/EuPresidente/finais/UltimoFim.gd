extends Control


func _ready():
	$Popular.text = str(int(Global.apPopulacao / 4.5)) + "%"
	$Congresso.text = str(int(Global.apCongreco / 4.5)) + "%"
	if(Global.personagem == 1):
		$Sprite2.texture = load("res://imag/CardsNovos/President_1/04.png")
	elif(Global.personagem == 2):
		$Sprite2.texture = load("res://imag/CardsNovos/President_1/01.png")
	elif(Global.personagem == 3):
		$Sprite2.texture = load("res://imag/CardsNovos/President_1/03.png")
	elif(Global.personagem == 4):
		$Sprite2.texture = load("res://imag/CardsNovos/President_1/02.png")
	if Global.apPopulacao > 400 and Global.apCongreco > 400:
		$Label.text = Global.nomePessoa+", você fez decisões excepcionais e finalizou seu mandato com uma aprovação excelente. Pronto para a reeleição?"
	elif Global.apPopulacao < 270 and Global.apCongreco < 270:
		$Label.text = Global.nomePessoa+", você não teve uma aprovação muito boa e um pedido de impeachment foi aberto contra você."
	else:
		$Label.text = Global.nomePessoa+", você tomou decisões razoáveis e finalizou seu mandato de forma satisfatória."



func _on_TextureButton_pressed():
	Global.pontuacao = 0
	Global.fase = "01"
	Global.apCongreco = 0
	Global.apPopulacao = 0
	Global.gX = 0
	Global.gY = 0
	get_tree().change_scene("res://Telas/PersonagemEscolha.tscn")
