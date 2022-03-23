extends Node2D

func _ready():
	pass

func criar_bloco(): #Função criada para criar novos blocos quando chamada.
		var novobloco = preload("res://bloco.tscn").instance()
		get_parent().add_child(novobloco)



func _on_sensor_body_entered(body): #Se o bloco passar por essa area2d, então a funcão criar_bloco() é chamada.
	criar_bloco()


func _on_sensor2_body_entered(body): #Se o bloco passar por essa area2d, então o jogo é finalizado e cena de fim é chamada.
	$'.'.get_tree().paused = true
	get_tree().change_scene("res://fim_mini3.tscn")
