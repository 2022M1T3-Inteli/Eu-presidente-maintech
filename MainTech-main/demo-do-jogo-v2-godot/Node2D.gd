extends Node2D
# Para inicio do jogo os botoes principais de escolha comecao com a visibilidade desligada.
func _ready():
	$Button2.visible = false
	$Button3.visible = false
	$Button4.visible = false
	$Button5.visible = false
	$Card1.visible = false
	$"Educação-política-veto-presidencial1-scaled".visible = false
	$Button6.visible = false
	$Label.text = "Aprovação Popular: 40%"
	$Label2.text = "Aprovação do Congresso: 50%"
	$Label.visible = false
	$Label2.visible = false
	var reiniciar = Button.new()
	reiniciar.text = "reiniciar"
	reiniciar.connect("pressed", self, "_reiniciar_pressed")
	add_child(reiniciar)

func _reiniciar_pressed(): # funcao para reiniciar o jogo pelo metodo reload_current_scene()
	get_tree().reload_current_scene()

func _on_Button_pressed(): # Funcao para quando aperta o BTN Iniciar, perceba que ele faz com que os dois BTNS secundarios sumam e os principais aparecao
	$Button.visible = false
	$Card1.visible = true
	$Button2.visible = true
	$Button3.visible = true
	$Button4.visible = true
	$Button5.visible = true
	$Label.visible = true
	$Label2.visible = true


func _on_Button5_pressed():
	$Button5.visible = false
	$Button2.visible = false
	$Button3.visible = false
	$Button4.visible = false
	$Button6.visible = true
	$Card1.visible = false
	$"Educação-política-veto-presidencial1-scaled".visible = true
	$Label.visible = false
	$Label2.visible = false



func _on_Button6_pressed():
	$Button6.visible = false
	$"Educação-política-veto-presidencial1-scaled".visible = false
	$Button2.visible = true
	$Button3.visible = true
	$Button4.visible = true
	$Button5.visible = true
	$Card1.visible = true
	$Label.visible = true
	$Label2.visible = true


func _on_Button2_pressed(): # Ao precionar vetar parcialmente
	$Button2.visible = false
	$Button3.visible = false
	$Button4.visible = false
	$Button5.visible = false
	$Label.text = "Aprovação Popular: 80%"
	$Label2.text = "Aprovação do Congresso: 70%"



func _on_Button3_pressed(): # Ao precionar sancional
	$Button2.visible = false
	$Button3.visible = false
	$Button4.visible = false
	$Button5.visible = false
	$Label.text = "Aprovação Popular: 20%"
	$Label2.text = "Aprovação do Congresso: 30%"


func _on_Button4_pressed(): # Ao precionar vetar parcialmente
	$Button2.visible = false
	$Button3.visible = false
	$Button4.visible = false
	$Button5.visible = false
	$Label.text = "Aprovação Popular: 60%"
	$Label2.text = "Aprovação do Congresso: 60%"
