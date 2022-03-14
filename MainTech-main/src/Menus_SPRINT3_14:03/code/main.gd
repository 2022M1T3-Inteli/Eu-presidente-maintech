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
	$Chamadas.frame = 0
	pass # Replace with function body.

func _process(delta):
	print(P,";",N)
	if (porta2 == false ):
		$Consulta_sprite.hide() # Esconde a SPRITE de consulta
		$Consulta.text = "Consultar"
		porta3 = false
		
	else:
		$Consulta.text = "Voltar"
		$Consulta_sprite.show() # Mostra a SPRITE de consulta
		porta3 = true
		
		
	if (porta1 == true):
		$Chamadas.hide()
		porta3 = true
	else: 
		$Chamadas.show()
		porta3 = false
	
	$Chamadas.frame_coords.x = P
	$Chamadas.frame_coords.y = N
	
	
	if(P > 3 or N > 3 ):
		get_tree().change_scene("res://Telas/MiniGameDinheiro.tscn") # Iniciar o mini game
		

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



