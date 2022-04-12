extends Node2D
signal PROXIMO



func _on_Button_button_up():
	emit_signal("PROXIMO")
	$Button.disabled = true
