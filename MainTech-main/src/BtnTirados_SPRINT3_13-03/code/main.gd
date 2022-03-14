extends Node2D


# Declare member variables here. Examples:
var P = 0 # Essa variavel serve como valor X das cordenadas
var N = 0 # Essa variavel serve como o outro valor Y das cordenadas
var porta1 = false # Essa Bolean esta aqui para o sistema de Start do jogo
var porta2 = false # Usada como porta para BTN consultar
var porta3 = true # Essa Bolean restringe a atualizacao das cordenadas ao momento de escolha ( "concordar" e "discordar" )



# As cordenadas comecao inicialmente em (1;1)
func _ready():
	
	$Chamadas.frame_coords = Vector2(1,1)


func _process(delta):
	print(P,";",N)
	
	if (porta2 == false ):
		$Consulta_sprite.hide() # Esconde a SPRITE de consulta
		$BTN/Consulta.text = "Consultar"
		porta3 = false
		porta1 = false
		
	else:
		$BTN/Consulta.text = "Voltar"
		$Consulta_sprite.show() # Mostra a SPRITE de consulta
		porta3 = true
		porta1 = true
		
		
	if (porta1 == true):
		$Chamadas.hide()
		porta3 = true
	else: 
		$Chamadas.show()
		porta3 = false
	
	$Chamadas.frame_coords.x = P
	$Chamadas.frame_coords.y = N
	
	
	if(P + N == 3 ):
		get_tree().change_scene("res://Telas/MiniGameDinheiro.tscn") # Iniciar o mini game
		

func _on_Positivo_button_up(): # Quando precionado adiciona +1 a cordenada X
	if(porta3 == false):
		P += 1



func _on_Negativo_button_up(): # Quando precionado adiciona +1 a cordenada Y
	if(porta3 == false):
		N += 1


func _on_Consulta_button_up(): # Quando precionado muda o estado da Variavel que controla o BTN de consulta, usada na linha 22
	if (porta2 == false):
		porta2 = true
	else:
		porta2 = false



