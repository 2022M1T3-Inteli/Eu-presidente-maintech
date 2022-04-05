extends Node2D

func _ready():
	$FIM2.visible = false

func criar_bloco():
		var novobloco = preload("res://bloco.tscn").instance()
		get_parent().add_child(novobloco)



func _on_sensor_body_entered(body):
	criar_bloco()


func _on_sensor2_body_entered(body):
	$'.'.get_tree().paused = true
	get_tree().change_scene("res://fim_mini3.tscn")
