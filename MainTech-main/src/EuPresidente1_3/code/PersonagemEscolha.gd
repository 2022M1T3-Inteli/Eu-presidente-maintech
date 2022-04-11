extends Node2D

#Setando as variáveis
var mouseKB4 = false
var mouseKB3 = false
var mouseKB2 = false
var mouseKB1 = false
var trava4 = false
var trava3 = false
var trava2 = false
var trava1 = false

#Quando clicar na seta, troca para a cena principal do escritório
func _on_Button_pressed():
	Global.nomePessoa = $LineEdit.text
	if trava4 == true and $LineEdit.text != "":
		MusicController.play_music()
		get_tree().change_scene("res://Telas/main.tscn")
		print(Global.nomePessoa,Global.personagem)

#Quando clicar em um dos personagens, troca para o frame colorido e variável fica true para travar a função de saída do mouse
#O outro quando clica com o botão direito do mouse, seta tudo para as configurações iniciais, deixando a variável como false
func _process(delta):
	#idea: pra poder escolher outro personagem, clica de novo no que quer des selecionar
	#cada click vai somar 1 no contador, os ímpares fica selecionado, e os pares o contrário
	#dividir o num por 2. Se tiver resto é ímpar, se não é par.
	if Input.is_action_pressed("ui_click") and mouseKB4 == true:
		Global.personagem = 4
		$KB4/AS4.frame = 1
		trava4 = true
		trava3 = true
		trava2 = true
		trava1 = true
	if Input.is_action_pressed("ui_direito") and mouseKB4 == true:
		$KB4/AS4.frame = 0
		trava4 = false
		trava3 = false
		trava2 = false
		trava1 = false
	if Input.is_action_pressed("ui_click") and mouseKB3 == true:
		Global.personagem = 3
		$KB3/AS3.frame = 1
		trava4 = true
		trava3 = true
		trava2 = true
		trava1 = true
	if Input.is_action_pressed("ui_direito") and mouseKB3 == true:
		$KB3/AS3.frame = 0
		trava4 = false
		trava3 = false
		trava2 = false
		trava1 = false
	if Input.is_action_pressed("ui_click") and mouseKB2 == true:
		Global.personagem = 2
		$KB2/AS2.frame = 1
		trava4 = true
		trava3 = true
		trava2 = true
		trava1 = true
	if Input.is_action_pressed("ui_direito") and mouseKB2 == true:
		$KB2/AS2.frame = 0
		trava4 = false
		trava3 = false
		trava2 = false
		trava1 = false
	if Input.is_action_pressed("ui_click") and mouseKB1 == true:
		$KB1/AS1.frame = 1
		Global.personagem = 1
		trava4 = true
		trava3 = true
		trava2 = true
		trava1 = true
	if Input.is_action_pressed("ui_direito") and mouseKB1 == true:
		$KB1/AS1.frame = 0
		trava4 = false
		trava3 = false
		trava2 = false
		trava1 = false
#Todos esses fazem a mesma coisa para cada um dos 4 personagens
#Quando o mouse entra, coloca a imagem colorida, e quando o mouse sai, troca para a imagem preta
#Além disso, o tamanho aumenta e volta ao normal quando tira o mouse da imagem
func _on_KB4_mouse_entered():
	if trava4 == false:
		$KB4/AS4.frame = 1
		$KB4/AS4.scale.x = 0.75
		$KB4/AS4.scale.y = 0.75
		mouseKB4 = true
func _on_KB4_mouse_exited():
	if trava4 == false:
		$KB4/AS4.frame = 0
		mouseKB4 = false
		$KB4/AS4.scale.x = 0.5
		$KB4/AS4.scale.y = 0.5
######################################################################
func _on_KB3_mouse_entered():
	if trava3 == false:
		$KB3/AS3.frame = 1
		$KB3/AS3.scale.x = 1.50
		$KB3/AS3.scale.y = 1.50
		mouseKB3 = true
func _on_KB3_mouse_exited():
	if trava3 == false:
		$KB3/AS3.frame = 0
		mouseKB3 = false
		$KB3/AS3.scale.x = 1.0
		$KB3/AS3.scale.y = 1.0
######################################################################
func _on_KB2_mouse_entered():
	if trava2 == false:
		$KB2/AS2.frame = 1
		$KB2/AS2.scale.x = 0.75
		$KB2/AS2.scale.y = 0.75
		mouseKB2 = true
func _on_KB2_mouse_exited():
	if trava2 == false:
		$KB2/AS2.frame = 0
		mouseKB2 = false
		$KB2/AS2.scale.x = 0.5
		$KB2/AS2.scale.y = 0.5
######################################################################
func _on_KB1_mouse_entered():
	if trava1 == false:
		$KB1/AS1.frame = 1
		$KB1/AS1.scale.x = 0.75
		$KB1/AS1.scale.y = 0.75
		mouseKB1 = true
func _on_KB1_mouse_exited():
	if trava1 == false:
		$KB1/AS1.frame = 0
		mouseKB1 = false
		$KB1/AS1.scale.x = 0.5
		$KB1/AS1.scale.y = 0.5
######################################################################
