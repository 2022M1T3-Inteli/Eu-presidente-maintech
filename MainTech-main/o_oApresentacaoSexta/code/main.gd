extends Node2D


# Declare member variables here. Examples:
var foco = ""
var cardTree 
var porta1 = true # Essa Bolean esta aqui para o sistema de Start do jogo
var porta2 = false # Usada como porta para BTN consultar
var porta3 = true # Essa Bolean restringe a atualizacao das cordenadas ao momento de escolha ( "concordar" e "discordar" )
var mineGamem  = false #Não é ultil
var click = 0
var falas = false

# As cordenadas comecao inicialmente em (0;0)
func _ready():
	$BTN/Consulta.visible = false
	if (Global.sprite == ""):
		cardTree = load("res://matriz jogo.png")
	else:
		cardTree = load(Global.sprite)
	$Chamadas.texture = cardTree
	if(Global.fase == "01" or Global.fase == ""):
		$BTN/B.rect_position =  Vector2(0,0)
		$BTN/A.rect_position =  Vector2(0,0)
		falas = false
		$BTN/Papel.frame = 0
		$HUD/Node2D/Congra.value = 60
		$HUD/Node2D/Pop.value = 60
		Global.gY = 0
		Global.gX = 0
		mineGamem = false
		
	elif(Global.fase == "02"):
		$Control.vai = true
		$BTN/B.rect_position =  Vector2(0,0)
		$BTN/A.rect_position =  Vector2(0,0)
		Global.gY = 3
		Global.gX = 0
		porta1 = true
		click = 0
		print(Global.gY + Global.gX)
		mineGamem = false
		
		
	elif(Global.fase == "03"):
		$BTN/B.rect_position =  Vector2(0,0)
		$BTN/A.rect_position =  Vector2(0,0)
		$Control.vai = false
		Global.gY = 6
		Global.gX = 0
		porta1 = true
		mineGamem = false
		
		
	

func _process(delta):
	
	if($Control.a > 2):
			falas = true
	
	if (porta2 == false ):
		$Consulta_sprite.hide() # Esconde a SPRITE de consulta
		porta3 = false
		
	else:
		#$Consulta_sprite.show() # Mostra a SPRITE de consulta
		porta3 = true
		
		
	if (porta1 == true):
		$Chamadas.hide()
		$BTN/Negativo.rect_position = Vector2(0,0)
		$BTN/Positivo.rect_position = Vector2(0,0)
		porta3 = true
	else: 
		$BTN/Negativo.rect_position = Vector2(517,411)
		$BTN/Positivo.rect_position = Vector2(344,411)
		$Chamadas.visible = true
		$Chamadas.show()
		porta3 = false
	
	if(foco == "papel"):
		if(Input.is_action_just_pressed("ui_click") and $Chamadas.visible == false):
			porta1 = false
			Global.expandir($Chamadas)
			print("aqui",$Chamadas.position)
	
	$Chamadas.frame_coords.x = Global.gX
	$Chamadas.frame_coords.y = Global.gY
	#print(Global.gY,Global.gX)
	print($Chamadas.position, $Chamadas.visible)
	
	if((Global.fase == "" or Global.fase == "01") and (Global.gX + Global.gY > 1)):
		escolha(true,"")
		if(mineGamem == true):
			get_tree().change_scene("res://Telas/MiniGameDinheiro.tscn")
			
	elif(Global.gX + Global.gY > 4 and  Global.fase == "02"):
		
		if(falas == false and $Control.vai == true):
			porta1 = true
			$BTN/Consulta.visible = true
			$Control.visible = true
			#$Control.vai = false
		else:
			$Control.visible=false
			porta1 = false
			$BTN/Consulta.visible = false
			escolha(true,"proximo")
			print("Foi", " Falas:",falas, " Vai:",$Control.vai)
			
		
		if(mineGamem == true and falas == true):
			get_tree().change_scene("res://Telas/minigame-corrida.tscn")
			
	elif(Global.gX + Global.gY > 7 and Global.fase == "03"):
		escolha(true,"")
		if(mineGamem == true):
			get_tree().change_scene("res://Bagunca/mini3.tscn")
			

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
	

	



func _on_B_button_down():
	if(Global.fase == "" or Global.fase == "01" ):
		Global.skinsGames = "vender"
		Global.gX += 1
		mineGamem = true
		print(Global.skinsGames)

	elif(Global.fase == "02" ):
		Global.gX += 1
		mineGamem = true
		

	elif(Global.fase == "03" ):
		Global.gX += 1
		mineGamem = true
		




func _on_A_button_down():
	if(Global.fase == "" or Global.fase == "01" ):
		mineGamem = true
		Global.gX += 1

	elif(Global.fase == "02" ):
		Global.skinsGames ="floresta"
		Global.gX += 1
		mineGamem = true

	elif(Global.fase == "03" ):
		Global.gX += 1
		mineGamem = true

func escolha(a,b):
	if(a == true):
		$BTN/B.rect_position =  Vector2(537,405)
		$BTN/A.rect_position =  Vector2(314,405)
		$BTN/Negativo.rect_position = Vector2(0,0)
		$BTN/Positivo.rect_position = Vector2(0,0)
	elif(b=="proximo"):
		$BTN/B.rect_position =  Vector2(612,455)
		$BTN/B.rect_position =  Vector2(0,0)
		$BTN/A.rect_position =  Vector2(0,0)
		$BTN/Negativo.rect_position = Vector2(0,0)
		$BTN/Positivo.rect_position = Vector2(0,0)
