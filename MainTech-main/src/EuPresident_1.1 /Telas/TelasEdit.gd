extends Node


# Declare member variables here. Examples:
var click = false
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Control/H_frames.visible = false
	$Control/V_frames.visible = false
	$Control/CL.visible = false
	$Control/CheckBox.pressed = true
	$Control/CheckBox2.pressed = true
	$Control/Label2.visible = false
	if Global.musica == false:
		$Control/CheckBox.pressed = false
	if Global.som == false:
		$Control/CheckBox2.pressed = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if($Control/CheckBox.pressed == true):
		Global.musica = true
	else:
		Global.musica = false
		
	if($Control/CheckBox2.pressed == true):
		Global.som = true
	else:
		Global.som = false
	
		
	if(click == true and $Control/Path.text == "" or $Control/Path.text == null ):
		$Control/Label.text = "Algo deu errado, " + $Control/Path.text + "nao foi encontrado" + "C:" + Global.Coluna + "L:" + Global.Linha
		yield(get_tree().create_timer(1.5),"timeout")
		click = false
		$Control/Label.text = ""
	else:
		Global.sprite = $Control/Path.text 
		Global.Coluna = $Control/H_frames.text
		Global.Linha = $Control/V_frames.text
		if(click == true):
			click == false
			$Control/Label.text = Global.sprite
			



func _on_Acept_button_up():
	click = true


func _on_volta_button_down():
	get_tree().change_scene("res://Telas/Menu.tscn")


func _on_Path_mouse_entered():
	$Control/H_frames.visible = true
	$Control/V_frames.visible = true
	$Control/CL.visible = true
	$Control/Label2.visible = true
	


func _on_Path_mouse_exited():
	$Control/Label2.visible = false



func _on_H_frames_mouse_entered():
	$Control/H_frames.text = ""


func _on_V_frames_mouse_entered():
	$Control/V_frames.text = ""
