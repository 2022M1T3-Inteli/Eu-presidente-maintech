extends Node2D

func _ready():
	pass

#Quando clicar no botão, troca para o menu de personagens
func _on_Button_button_down():
	MusicController.play_music()
	get_tree().change_scene("res://Telas/PersonagemEscolha.tscn")

	#get_tree().change_scene("res://Telas/PersonagemEscolha.tscn")


func _on_Button2_pressed():
	$Button2/settings.visible = false
	yield(get_tree().create_timer(0.25),"timeout")
	$Button2/settings.visible = true
	yield(get_tree().create_timer(0.25),"timeout")
	get_tree().change_scene("res://Telas/TelasEdit.tscn") 


func _on_Button_mouse_entered():
	$"Button/BotãoDeJogar".frame = 1


func _on_Button_mouse_exited():
	$"Button/BotãoDeJogar".frame = 0
