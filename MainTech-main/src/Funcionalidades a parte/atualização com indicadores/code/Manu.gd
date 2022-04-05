extends Node2D

func _ready():
	pass

#Quando clicar no botão, troca para o menu de personagens
func _on_Button_button_up():
	get_tree().change_scene("res://Telas/PersonagemEscolha.tscn") 
	#get_tree().change_scene("res://Telas/PersonagemEscolha.tscn")


func _on_Button2_pressed():
	get_tree().change_scene("res://Telas/TelasEdit.tscn") 
