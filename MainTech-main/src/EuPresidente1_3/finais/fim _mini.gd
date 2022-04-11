extends Node2D


func _ready():
	if(Global.skinsGames == "vender"):
		$Control/Sprite.texture = load("res://Minigame1/Imagens1/Paint_MIneGameDinheiro.jpg")
	elif(Global.skinsGames == "escola"):
		$Control/Sprite.texture = load("res://Minigame3/Imagens3/TESTE 1.jpg")
	elif(Global.skinsGames == "floresta"):
		$Control/Sprite.texture = load("res://Minigame2/Imagens2/fundoFloresta.jpg")
	elif(Global.skinsGames == "rua"):
		$Control/Sprite.texture = load("res://Minigame2/Imagens2/fundoEstrada.jpg")
	elif(Global.skinsGames == "eletrica"):
		$Control/Sprite.texture = load("res://Minigame3/Imagens3/grama teste.jpg")
	
	$Control/pontuacao.text = "Parabéns, " + Global.nomePessoa + ", você fez " + str(Global.pontuacao) + " pontos"



func _on_Button_button_up():
	get_tree().change_scene("res://Telas/main.tscn")
