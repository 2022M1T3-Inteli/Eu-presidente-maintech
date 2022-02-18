extends Node2D


# Declare member variables here. Examples:
var P = 0 # Essa variavel serve como valor das cordenadas
var N = 0 # Essa variavel serve como o outro valor das cordenadas
var porta1 = true # Essa Bolean esta aqui para o sistema de Start do jogo
var porta2 = false
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	P = 0
	N = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(P,";",N)
	if (porta2 == false ):
		$Sprite.hide()
		$Consulta.text = "Consultar"
		
	else:
		$Consulta.text = "Voltar"
		$Sprite.show()
		
		porta1 = true
	if (porta1 == true):
		$AnimatedSprite.hide()
		
	else: 
		$AnimatedSprite.show()
	
	if(P == 1 and N == 0):
		print("Dentro p1;n0")
		$Label.text = "Apoio Popular: 80%"
		$Label2.text = "Apoio Camara: 08%"
		$AnimatedSprite.play("card3")
		
	if(P == 1 and N == 2):
		print("Dentro p1;n2")
		$AnimatedSprite.play("card2")
		$Label.text = "Apoio Popular: 50%"
		$Label2.text = "Apoio Camara: 70%"
		
	if(P == 1 and N == 1):
		print("Dentro p1;n1")
		$AnimatedSprite.play("card1")
	if(P>1):
		
		P = 1
		N = 1
	if(N > 2):
		P = 1
		N = 2

func _on_Positivo_button_up():
	P += 1
	pass # Replace with function body.


func _on_Negativo_button_up():
	N += 1
	pass # Replace with function body.


func _on_Reorganizar_button_up():
	get_tree().change_scene("res://Node2D.tscn")
	pass # Replace with function body.


func _on_comeca_button_up():
	print("False")
	porta1=false
	pass # Replace with function body.


func _on_Consulta_button_up():
	if (porta2 == false):
		porta2 = true
	else:
		porta2 = false
	pass # Replace with function body.
