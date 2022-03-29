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
	"As Propostas de Emendas Constitucionais são mudanças, incrementos ou exclusões na Constituição Federal.                                                                Você só não pode mexer nas " + "Cláusulas Pétreas;" 
	]

# As cordenadas comecao inicialmente em (0;0)
func _ready():
	$BTN/Papel.frame = 0
	if (Global.sprite == ""):
		cardTree = load("res://imag/CardsTree.jpg")
	else:
		cardTree = load(Global.sprite)
	$Chamadas.texture = cardTree
	print($BTN/proximo.visible)
	$BTN/proximo.visible = false
	$BTN/Aumentar.visible = false
	$BTN/Vender.visible = false
	$BTN/Aumentar.disabled = true
	$BTN/Vender.disabled = true
	$Importante_01.visible = false
	$Importante_02.visible = false
	$Importante_03.visible = false
	$Importante_01.frame = 0
	$proibido.visible = false
	if(Global.fase == "01" or Global.fase == ""):
		$HUD/Node2D/Congra.value = 60
		$HUD/Node2D/Pop.value = 60
		Global.gN = 0
		Global.gP = 0
		
	elif(Global.fase == "02"):
		porta1 = true
		click = 0
		print(Global.gN + Global.gP)
		$BTN/proximo.visible = true
		$Importante_03.visible = true
		$Importante_03/Label.text = falas[0]
		$Importante_03/AnimationPlayer.play("intro_emenda")
	elif(Global.fase == "03"):
		yield(get_tree().create_timer(2),"timeout")
		get_tree().change_scene("res://Bagunca/mini3.tscn")
		
	

func _process(delta):
	#print(Global.gP,";",Global.gN)
	
		
		
	
	if (porta2 == false ):
		$Consulta_sprite.hide() # Esconde a SPRITE de consulta
		$BTN/Consulta.text = "Consultar"
		porta3 = false
		
	else:
		$BTN/Consulta.text = "Voltar"
		$Consulta_sprite.show() # Mostra a SPRITE de consulta
		porta3 = true
		
		
	if (porta1 == true):
		$Chamadas.visible = true
		$Chamadas.hide()
		porta3 = true
	else: 
		$Chamadas.visible = true
		$Chamadas.show()
		porta3 = false
	
	if(foco == "papel"):
		if(Input.is_action_just_pressed("ui_click") and $Importante_01.visible == false and $Importante_02.visible == false and $Importante_03.visible == false and $Chamadas.visible == false):
			porta1 = false
			Global.expandir($Chamadas)
	
	$Chamadas.frame_coords.x = Global.gP
	$Chamadas.frame_coords.y = Global.gN
	
	
	if(Global.gP + Global.gN == 2 and Global.fase == ""):
		$BTN/Positivo.visible = false
		$BTN/Negativo.visible = false
		$Importante_01.visible = true
		$BTN/Aumentar.visible = true
		$BTN/Vender.visible = true
		$BTN/Aumentar.disabled = false
		$BTN/Vender.disabled = false
		$Importante_03.visible = false
		porta1 = true
		
		
	#elif(Global.fase == "02"):
		#$Importante_03.visible = true
		#$Importante_03/Label.text = falas[1]
		#$Importante_03/AnimationPlayer.play("intro_emenda")
	
		
	if(Global.gP + Global.gN >= 4):
		$Importante_02.visible = true
		porta1 = false
		if(mine2==true):
			print("Chegou",Global.gP,Global.gN)
			get_tree().change_scene("res://Telas/minigame-corrida.tscn")
			
		
func _on_Positivo_button_up(): # Quando precionado adiciona +1 a cordenada X
	if(porta3 == false):
		Global.gP += 1
		$BTN/Papel.frame +=1
		if(Global.gN == 1 and Global.gP == 0):
			$HUD/Node2D/Pop.value += 5
		
	elif(Global.gN == 1 and Global.gP == 1):
		$HUD/Node2D/Congra.value += 5



func _on_Negativo_button_up(): # Quando precionado adiciona -1 a cordenada X
	if(porta3 == false):
		Global.gN += 1
		$BTN/Papel.frame +=1
		if(Global.gN == 1 and Global.gP == 0):
			$HUD/Node2D/Pop.value += 20
		
	elif(Global.gN == 1 and Global.gP == 1):
		$HUD/Node2D/Congra.value += 20


func _on_Consulta_button_up():
	if (porta2 == false):
		porta2 = true
	else:
		porta2 = false



func _on_Vender_pressed():
	Global.skinsGames = "vender"
	yield(get_tree().create_timer(0.1),"timeout")
	get_tree().change_scene("res://Telas/MiniGameDinheiro.tscn")


func _on_Aumentar_pressed():
	Global.skinsGames = "Aumentar"
	yield(get_tree().create_timer(0.1),"timeout")
	get_tree().change_scene("res://Telas/MiniGameDinheiro.tscn")



func _on_SaibaMais_mouse_entered():
	if(porta1 == true):
		print("Dentro")
		$Importante_01.frame = 1



func _on_SaibaMais_mouse_exited():
	$Importante_01.frame = 0



func _on_Button_pressed():
	mine2 = true
	pass # Replace with function body.


func _on_Tablet_mouse_entered():
	print(cardTree)
	print("tablet")
	pass # Replace with function body.


func _on_PapelArea_mouse_entered():
	foco = "papel"
	

func _on_proximo_pressed():
	if(click >= 1 ):
		$BTN/proximo.visible = false
		$Importante_03.visible = false
		porta1 = false
	else:
		click += 1 
		$proibido.visible = true
		$Importante_03/Label.text = falas[1]
		$Importante_03/AnimationPlayer.play("intro_emenda")	
	
	
	
