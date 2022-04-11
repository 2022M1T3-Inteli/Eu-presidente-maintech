extends Control

signal START
signal FIM


func _on_Transicao_START():
	$Black/Anima.play("Transition")



func _on_Anima_animation_finished(anim_name):
	emit_signal("FIM")
