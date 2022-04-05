extends Node2D
var novobloco
var dentro = 0
func _ready():
	pass
func criar_bloco(): #Função criada para criar novos blocos quando chamada.
		novobloco = preload("res://Bagunca/bloco.tscn").instance()
		get_parent().add_child(novobloco)
func _on_sensor_body_entered(body): #Se o bloco passar por essa area2d, então a funcão criar_bloco() é chamada.
	criar_bloco()
	Global.pontuacao += 1
	$sensor/CollisionShape2D.position.y -= 60
	print(Global.pontuacao)
	$Camera.position.y -= 60
	novobloco.position.y -= (Global.pontuacao*60)
	dentro = 1

func _on_sensor2_body_entered(body): #Se o bloco passar por essa area2d, então o jogo é finalizado e cena de fim é chamada.
	$'.'.get_tree().paused = true
	get_tree().change_scene("res://Bagunca/fim_mini3.tscn")

func _process(delta):
	if novobloco != null:
		if dentro == 0 and novobloco.position.y == $sensor.position.y:
			$'.'.get_tree().paused = true
			get_tree().change_scene("res://Bagunca/fim_mini3.tscn")


func _on_sensor_area_exited(area):
	dentro = 0
	pass # Replace with function body.
