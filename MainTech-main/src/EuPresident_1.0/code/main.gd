extends Node2D



var foco = "" # Area de interesse, podendo ter dois estados atualmente "tablet" ou "papel", o que acontece em cada um deles é controlado no _process 
var cardTree # Variavel que guarda a textura do cardTree
var porta1 = true # Essa Bolean esta aqui para o sistema de Start do jogo, quando false o cardTree aparece
var porta2 = false # Usada como porta para BTN consultar
var porta3 = true # Essa Bolean restringe a atualizacao das cordenadas ao momento de escolha ( "concordar" e "discordar" )
var mineGamem  = false #Não é ultil
var click = 0
var falas = false # Controla a aparicao do acessor
var info = false

# _ready: Execucoes iniciais para toda vez que entrar nessa cena
func _ready():
	if (Global.sprite == ""): # Caso não haja modificacao no cardTree
		cardTree = load("res://imag/CardsNovos/CardTreeGUIA.jpg") # Seta cardTree padrao
		$Chamadas.hframes = 3
		$Chamadas.vframes = 7
	else: # Seta cardTree personalizado
		cardTree = load(Global.sprite) 
		$Chamadas.hframes = int(Global.Coluna)
		$Chamadas.vframes = int(Global.Linha)
		
	# Controle de fase
	if(Global.fase == "01" or Global.fase == ""): # Execucoes iniciais para fase 01
		$Control.a = 0
		$BTN/B.rect_position =  Vector2(0,0)
		$BTN/A.rect_position =  Vector2(0,0)
		falas = true
		$Control.vai = true 
		$BTN/Papel.frame = 0
		$HUD/Node2D/Congra.value = 60
		$HUD/Node2D/Pop.value = 60
		Global.gY = 0
		Global.gX = 0
		mineGamem = false # Controla a chamada para o minegame
		
	elif(Global.fase == "02"): # Execucoes iniciais para fase 02
		$Control.a = 9
		$Control.vai = true # Ativa a possibilidade de falas do acessor
		$BTN/B.rect_position =  Vector2(0,0)
		$BTN/A.rect_position =  Vector2(0,0)
		Global.gY = 3
		Global.gX = 0
		porta1 = true
		click = 0
		print(Global.gY + Global.gX)
		mineGamem = false
		
	elif(Global.fase == "03"): # Execucoes iniciais para fase 03
		$Control.a = 12
		$BTN/B.rect_position =  Vector2(0,0)
		$BTN/A.rect_position =  Vector2(0,0)
		$Control.vai = true 
		Global.gY = 6
		Global.gX = 0
		porta1 = true
		mineGamem = false
	$Chamadas.texture = cardTree # Seta a textura da $Chamadas para o cardTree atual
	$BTN/Consulta.visible = false

func _process(delta):
	
	if Global.contador == 1: #define a posicao do "sensor" dependendo do card em que esta
		$Info.rect_position = Vector2(600, 250)
	if Global.contador == 2:
		$Info.rect_position = Vector2(500,300)
	if Global.contador == 3:
		$Info.rect_position = Vector2(440, 250)
	if Global.contador == 4:
		$Info.rect_position = Vector2(570, 330)
		$Info2.rect_position = Vector2 (470, 330)
	if Global.contador == 6:
		$Info.rect_position = Vector2(550, 200)
		
	if (porta2 == false ):
		$Consulta_sprite.hide() # Esconde a SPRITE de consulta
		porta3 = false
		
	else:
		#$Consulta_sprite.show() # Mostra a SPRITE de consulta
		porta3 = true

# Chamas Ativa ou Inertis
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

# Casos da area de interresse
	if(foco == "papel"): 
		if(Input.is_action_just_pressed("ui_click") and $Chamadas.visible == false):
			porta1 = false
			Global.expandir($Chamadas,7)
			print("aqui",$Chamadas.position)
	elif(foco == "tablet"):
		if(Input.is_action_just_pressed("ui_click") and $Chamadas.visible == false and Global.fase != "03"):
			print("Essa funcionalidade só estara presente em futuras atualizaçoes")

# Atualização das cordenadas da Matriz cardTree
	$Chamadas.frame_coords.x = Global.gX
	$Chamadas.frame_coords.y = Global.gY
	#print(Global.gY,Global.gX)
	#print($Chamadas.position, $Chamadas.visible)

	if(Global.fase == "01" or Global.fase == ""):
		dialogo()
		if(Global.contador == 2 and $Control.a < 9):
			falas = true
			
	elif(Global.fase == "02"):
		dialogo()
		if(Global.contador == 5 and $Control.a <10):
			falas = true 
			print($Control.visible)
			
	elif(Global.fase == "03"):
		dialogo()
		print("contador:",Global.contador," a:",$Control.a)
		if(Global.contador == 7 and $Control.a < 13):
			falas = true
		elif(Global.contador == 8 and $Control.a < 14):
			pass


# Pre-mineGame
	if((Global.fase == "" or Global.fase == "01") and (Global.gX + Global.gY > 1) and (info == false)): # Termino das escolhas da fase 01
		escolha("escolha")
		if(mineGamem == true):
			get_tree().change_scene("res://Telas/MiniGameDinheiro.tscn")
			
	elif(Global.gX + Global.gY > 4 and  Global.fase == "02" and info == false): # Termino das escolhas da fase 02
		escolha("escolha")
		if(mineGamem == true):
			get_tree().change_scene("res://Telas/minigame-corrida.tscn")
			
	elif(Global.gX + Global.gY > 7 and Global.fase == "03" and info == false): # Termino das escolhas da fase 03
		escolha("escolha")
		if(mineGamem == true):
			get_tree().change_scene("res://Bagunca/mini3.tscn")

func _on_Positivo_button_up(): # Quando precionado adiciona +1 a cordenada X
	if(porta3 == false):
		Global.contador += 1
		Global.gX += 1
		$BTN/Papel.frame +=1
		if(Global.gY == 1 and Global.gX == 0):
			$HUD/Node2D/Pop.value += 5
		
	elif(Global.gY == 1 and Global.gX == 1):
		$HUD/Node2D/Congra.value += 5

func _on_Negativo_button_up(): # Quando precionado adiciona +1 a cordenada Y
	if(porta3 == false):
		Global.contador += 1
		Global.gY += 1
		$BTN/Papel.frame +=1
		if(Global.gY == 1 and Global.gX == 0):
			$HUD/Node2D/Pop.value += 20
		
	elif(Global.gY == 1 and Global.gX == 1):
		$HUD/Node2D/Congra.value += 20

func _on_Consulta_button_up(): # Botão proximo do acessor
	#print(falas,$Control.a )
	$Control.emit_signal("p")
	$Control.a += 1
	$Control.vai = true
	if($Control.a > 7 and Global.fase == "" or Global.fase == "01" ): # Caso ultrapasse a fala 4
		falas = false
	elif($Control.a >9):
		falas = false
	elif($Control.a > 11):
		falas = false
	elif($Control.a > 17 and Global.fase == "03"):
		falas = false

func _on_Tablet_mouse_entered(): # Area do tablet
	foco = "tablet" # Setando o foco para o tablet

func _on_PapelArea_mouse_entered():
	foco = "papel" # Setando o foco para o papel

func _on_B_button_down(): # Botão Direito que seta a Sking dos mine games
	Global.contador += 1 
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

func _on_A_button_down(): # Botão Esquerdo que seta a Sking dos mine games
	Global.contador += 1
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

func escolha(b): # Funcao que controla os Botoes princiapis
	if(b == "escolha"):
		$BTN/B.rect_position =  Vector2(537,405)
		$BTN/A.rect_position =  Vector2(314,405)
		$BTN/Negativo.rect_position = Vector2(0,0)
		$BTN/Positivo.rect_position = Vector2(0,0)
		$BTN/Negativo.disabled = true
		$BTN/Positivo.disabled = true
	if(b=="proximo"):
		$BTN/B.rect_position =  Vector2(0,0)
		$BTN/A.rect_position =  Vector2(0,0)
		$BTN/Negativo.rect_position = Vector2(0,0)
		$BTN/Positivo.rect_position = Vector2(0,0)
		$BTN/B.disabled = true
		$BTN/A.disabled = true
		$BTN/Negativo.disabled = true
		$BTN/Positivo.disabled = true


func _on_Info_mouse_entered(): #checa em qual card esta e manda para as coordenadas do card de informacao correspondente
	if(porta3 == false):
		info = true
		if Global.contador == 1:
			Global.gX = 2
			Global.gY = 2
		if Global.contador == 2:
			Global.gX = 1
			Global.gY = 2
		if Global.contador == 3:
			Global.gX = 2
			Global.gY = 1
		if Global.contador == 4:
			Global.gX = 1
			Global.gY = 6
		if Global.contador == 6:
			Global.gX = 2
			Global.gY = 5



func _on_Info_mouse_exited(): #volta para o card original quando o mouse sai
	info = false
	if(porta3 == false):
		if Global.contador == 1:
			Global.gX = 0
			Global.gY = 0
		if Global.contador == 2:
			Global.gX = 1
			Global.gY = 0
		if Global.contador == 3:
			Global.gX = 2
			Global.gY = 0
		if Global.contador == 4:
			Global.gX = 0
			Global.gY = 3
		if Global.contador == 6:
			Global.gX = 2
			Global.gY = 3


func _on_Info2_mouse_entered():
	info = true
	if(porta3 == false):
		if Global.contador == 4:
			Global.gX = 2
			Global.gY = 6


func _on_Info2_mouse_exited():
	info = false
	if(porta3 == false):
		if Global.contador == 4:
			Global.gX = 0
			Global.gY = 3

func dialogo():
	if(falas == true):
		porta1 = true
		$BTN/Consulta.visible = true
		$Control.visible = true
	else:
		$BTN/Consulta.visible = false
		$Control.visible = false
