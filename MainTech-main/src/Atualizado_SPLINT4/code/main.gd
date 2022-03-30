extends Node2D


# Declare member variables here. Examples:
var foco = ""
var cardTree 
var porta1 = true # Essa Bolean esta aqui para o sistema de Start do jogo
var porta2 = false # Usada como porta para BTN consultar
var porta3 = true # Essa Bolean restringe a atualizacao das cordenadas ao momento de escolha ( "concordar" e "discordar" )
var mine2 = false #Não é ultil
var click = 0
var falas = [
	"Agora que você já está com mais experiência em seu ofício, chegou a hora de aprender a propor uma Emenda constitucional!",
	"As Propostas de Emendas Constitucionais são mudanças, incrementos ou exclusões na Constituição Federal.                                                                Você só não pode mexer nas " + "Cláusulas Pétreas;",
	 
	]

# As cordenadas comecao inicialmente em (0;0)
func _ready():
	if (Global.sprite == ""):
		cardTree = load("res://imag/CardsNovos/CardTree_Guide.jpg")
	else:
		cardTree = load(Global.sprite)
	$Chamadas.texture = cardTree
	if(Global.fase == "01" or Global.fase == ""):
		$BTN/Papel.frame = 0
		$HUD/Node2D/Congra.value = 60
		$HUD/Node2D/Pop.value = 60
		Global.gY = 0
		Global.gX = 0
		
	elif(Global.fase == "02"):
		Global.gY = 3
		Global.gX = 0
		porta1 = true
		click = 0
		print(Global.gY + Global.gX)
		
	elif(Global.fase == "03"):
		Global.gY = 6
		Global.gX = 0
		porta1 = true
		
		
	

func _process(delta):
	
	
	if (porta2 == false ):
		$Consulta_sprite.hide() # Esconde a SPRITE de consulta
		$BTN/Consulta.text = "Consultar"
		porta3 = false
		
	else:
		$BTN/Consulta.text = "Voltar"
		#$Consulta_sprite.show() # Mostra a SPRITE de consulta
		porta3 = true
		
		
	if (porta1 == true):
		$Chamadas.hide()
		porta3 = true
	else: 
		$Chamadas.visible = true
		$Chamadas.show()
		porta3 = false
	
	if(foco == "papel"):
		if(Input.is_action_just_pressed("ui_click") and $Chamadas.visible == false):
			porta1 = false
			Global.expandir($Chamadas)
	
	$Chamadas.frame_coords.x = Global.gX
	$Chamadas.frame_coords.y = Global.gY
	print(Global.gY,Global.gX)
	
	if((Global.fase == "" or Global.fase == "01") and (Global.gX + Global.gY > 2)):
		if(Global.gX == 3 and Global.gY == 0 or Global.gX == 2 and Global.gY == 1 or Global.gX == 1 and Global.gY == 2 ):
			Global.skinsGames = "Aumentar"
		else:
			Global.skinsGames = "vender"
		get_tree().change_scene("res://Telas/MiniGameDinheiro.tscn")
		
	if(Global.gX + Global.gY > 5):
		get_tree().change_scene("res://Telas/minigame-corrida.tscn")
			
		
func _on_Positivo_button_up(): # Quando precionado adiciona +1 a cordenada X
	if(porta3 == false):
		Global.gX += 1
		$BTN/Papel.frame +=1
		if(Global.gY == 1 and Global.gX == 0):
			$HUD/Node2D/Pop.value += 5
		
	elif(Global.gY == 1 and Global.gX == 1):
		$HUD/Node2D/Congra.value += 5



func _on_Negativo_button_up(): # Quando precionado adiciona -1 a cordenada X
	if(porta3 == false):
		Global.gY += 1
		$BTN/Papel.frame +=1
		if(Global.gY == 1 and Global.gX == 0):
			$HUD/Node2D/Pop.value += 20
		
	elif(Global.gY == 1 and Global.gX == 1):
		$HUD/Node2D/Congra.value += 20


func _on_Consulta_button_up():
	$Control.a += 1
	$Control.vai = true
	if (porta2 == false):
		porta2 = true
	else:
		porta2 = false

func _on_SaibaMais_mouse_entered():
	if(porta1 == true):
		print("Dentro")


func _on_Tablet_mouse_entered():
	foco = "tablet"
	print(cardTree)
	print("tablet")
	pass # Replace with function body.


func _on_PapelArea_mouse_entered():
	foco = "papel"
	

	

