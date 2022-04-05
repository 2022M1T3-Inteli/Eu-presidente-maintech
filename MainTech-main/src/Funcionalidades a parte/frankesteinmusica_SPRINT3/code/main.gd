extends Node2D


# Declare member variables here. Examples:
var porta1 = false # Essa Bolean esta aqui para o sistema de Start do jogo
var porta2 = false # Usada como porta para BTN consultar
var porta3 = true # Essa Bolean restringe a atualizacao das cordenadas ao momento de escolha ( "concordar" e "discordar" )



# As cordenadas comecao inicialmente em (0;0)
func _ready():
	
	$Chamadas.frame_coords = Vector2(Global.gP,Global.gN)
	pass # Replace with function body.

func _process(delta):
	print(Global.gP,";",Global.gN)
	
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
	
	$Chamadas.frame_coords.x = Global.gP
	$Chamadas.frame_coords.y = Global.gN
	
	
	if(Global.gP >=1 and Global.gN == 2 or Global.gP == 2 and Global.gN >= 1 ):
		get_tree().change_scene("res://Telas/MiniGameDinheiro.tscn") # Iniciar o mini game
		
	elif(Global.gP > 3 or Global.gN > 3):
		get_tree().change_scene("res://Telas/minigame-corrida.tscn")
func _on_Positivo_button_up(): # Quando precionado adiciona +1 a cordenada X
	if(porta3 == false):
		Global.gP += 1



func _on_Negativo_button_up(): # Quando precionado adiciona -1 a cordenada X
	if(porta3 == false):
		Global.gN += 1


func _on_Consulta_button_up():
	if (porta2 == false):
		porta2 = true
	else:
		porta2 = false



