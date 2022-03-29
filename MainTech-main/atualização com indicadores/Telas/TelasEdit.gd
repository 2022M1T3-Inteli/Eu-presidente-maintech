extends Node


# Declare member variables here. Examples:
var click = false
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(click == true and $Control/Path.text == "" or $Control/Path.text == null ):
		$Control/Label.text = "Algo deu errado, " + $Control/Path.text + "nao foi encontrado"
		yield(get_tree().create_timer(1.5),"timeout")
		click = false
		$Control/Label.text = ""
	else:
		Global.sprite = $Control/Path.text 
		if(click == true):
			click == false
			$Control/Label.text = Global.sprite
			



func _on_Acept_button_up():
	click = true


func _on_volta_button_down():
	get_tree().change_scene("res://Telas/Menu.tscn")
