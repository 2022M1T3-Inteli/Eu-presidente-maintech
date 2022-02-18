extends Node2D

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

func _reiniciar_pressed():
	get_tree().reload_current_scene()

func _on_Button_pressed():
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


func _on_Button2_pressed():
	$Button2.visible = false
	$Button3.visible = false
	$Button4.visible = false
	$Button5.visible = false
	$Label.text = "Aprovação Popular: 80%"
	$Label2.text = "Aprovação do Congresso: 70%"



func _on_Button3_pressed():
	$Button2.visible = false
	$Button3.visible = false
	$Button4.visible = false
	$Button5.visible = false
	$Label.text = "Aprovação Popular: 20%"
	$Label2.text = "Aprovação do Congresso: 30%"


func _on_Button4_pressed():
	$Button2.visible = false
	$Button3.visible = false
	$Button4.visible = false
	$Button5.visible = false
	$Label.text = "Aprovação Popular: 60%"
	$Label2.text = "Aprovação do Congresso: 60%"
