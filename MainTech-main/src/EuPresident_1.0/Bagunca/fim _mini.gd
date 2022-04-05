extends Node2D


func _ready():
	$Control/pontuacao.text = "Parabéns, " + Global.nomePessoa + ", você fez " + str(Global.pontuacao) + " pontos"



func _process(delta):
	pass


func _on_Button_button_up():
	get_tree().change_scene("res://Telas/main.tscn")
