extends Node2D


# Declare member variables here. Examples:
var P = 0 # Essa variavel serve como valor X das cordenadas
var N = 0 # Essa variavel serve como o outro valor Y das cordenadas
var porta1 = true # Essa Bolean esta aqui para o sistema de Start do jogo
var porta2 = false # Usada como porta para BTN consultar
var porta3 = true # Essa Bolean restringe a atualizacao das cordenadas ao momento de escolha ( "concordar" e "discordar" )



# As cordenadas comecao inicialmente em (0;0)
func _ready():
	$Label.modulate = Color(0.231373, 0.227451, 0.333333)
	$Label2.modulate = Color(0.231373, 0.227451, 0.333333)
	$AnimatedSprite.play("card0")
	pass # Replace with function body.



func _process(delta):
	print(P,";",N)
	if (porta2 == false ):
		$Sprite.hide() # Esconde a SPRITE de consulta
		$Consulta.text = "Consultar"
		porta3 = false
		
	else:
		$Consulta.text = "Voltar"
		$Sprite.show() # Mostra a SPRITE de consulta
		porta3 = true
		
		
	if (porta1 == true):
		$AnimatedSprite.hide()
		porta3 = true
	else: 
		$AnimatedSprite.show()
		porta3 = false
	
		
	if(P == 1 and N == 0):
		print("Dentro p1;n0")
		$Label.modulate = Color(0.104736, 0.8125, 0.132383)
		$Label2.modulate = Color(0.382812, 0.034393, 0.034393)
		$Label.text = "Apoio Popular: 80%"
		$Label2.text = "Apoio Camara: 08%"
		$AnimatedSprite.play("card3")
		
	if(P == 1 and N == 2):
		print("Dentro p1;n2")
		$AnimatedSprite.play("card2")
		$Label.modulate = Color(0.632812, 0.785156, 0.211624)
		$Label2.modulate = Color(0.104736, 0.8125, 0.132383)
		$Label.text = "Apoio Popular: 50%"
		$Label2.text = "Apoio Camara: 70%"
		
	if(P == 1 and N == 1):
		print("Dentro p1;n1")
		$AnimatedSprite.play("card1")
	if(P>1):
		$AnimatedSprite.play("card0")
		P = 0
		N = 0
	if(P == 1 and N == 3):
		get_tree().change_scene("res://MiniGameDinheiro.tscn") # Iniciar o mini game
		
	if(P == 0 and N == 1 ):
		P = 1
		N = 0


func _on_Positivo_button_up(): # Quando precionado adiciona +1 a cordenada X
	if(porta3 == false):
		P += 1
	pass # Replace with function body.


func _on_Negativo_button_up(): # Quando precionado adiciona -1 a cordenada X
	if(porta3 == false):
		N += 1
	pass # Replace with function body.


func _on_Reorganizar_button_up(): # Ao precionar o BTN reorganizar o metodo reload_current_scene() recarrega o jogo "Restart"
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_comeca_button_up(): # BTN ouvir, 
	print("False")
	porta1=false
	pass # Replace with function body.


func _on_Consulta_button_up():
	if (porta2 == false):
		porta2 = true
	else:
		porta2 = false
	pass # Replace with function body.
