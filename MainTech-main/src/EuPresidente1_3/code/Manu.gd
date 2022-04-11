extends Node2D

<<<<<<< Updated upstream:MainTech-main/src/EuPresident_1.2/code/Manu.gd
export var url = "https://www.instagram.com/constituicaonasescolas/"

func _ready():
	pass

=======
export var url = "https://www.instagram.com/constituicaonasescolas" # Url para o instagram do progeto
>>>>>>> Stashed changes:MainTech-main/src/EuPresidente1.3/code/Manu.gd
#Quando clicar no botão, troca para o menu de personagens
func _on_Button_button_down():
	MusicController.play_music()
	get_tree().change_scene("res://Telas/PersonagemEscolha.tscn")

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


func _on_TextureButton_button_down():
<<<<<<< Updated upstream:MainTech-main/src/EuPresident_1.2/code/Manu.gd
	OS.shell_open(url)
=======
	OS.shell_open(url) # Metodo para abrir um link
>>>>>>> Stashed changes:MainTech-main/src/EuPresidente1.3/code/Manu.gd
