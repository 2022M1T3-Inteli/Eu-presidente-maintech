extends Control

signal START
signal FIM
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_Transicao_START():
	$Black/Anima.play("Transition")



func _on_Anima_animation_finished(anim_name):
	emit_signal("FIM")
