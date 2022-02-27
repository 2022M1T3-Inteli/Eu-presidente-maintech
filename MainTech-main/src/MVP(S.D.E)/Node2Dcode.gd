extends Node2D



onready var posicaoInicial = Vector2(500,300) # Variavel que seta a posicao inicial da sprite_Dinheiro
onready var x = 1 # Variavel usada para atualizar a posicao atual do X da sprite_Dinheiro
onready var y = 1 # Variavel usada para atualizar a posicao atual do Y da sprite_Dinheiro
onready var velocidadeX = 4 # Numero somado a variavel x
onready var velocidadeY = 4 # Numero somado a variavel y
onready var indoD = false # Porta, quando verdadeira permite que que velocidadeY seja subitraida da variavel y
onready var indoE = false # Porta, quando verdadeira permite que que velocidadeY seja somada a variavel y
onready var indoC = false # Porta, quando verdadeira permite que que velocidadeX seja subitraida da variavel x
onready var indoB = false # Porta, quando verdadeira permite que que velocidadeX seja ssomada a variavel x


func _ready():
	# Para que o codigo comece é necessario ao menos duas das portas serem verdadeiras 
	indoB = true 
	indoE = true
	
	$Dinheiro.position = posicaoInicial
	pass # Replace with function body.


func _process(delta):
	if(indoB == true):
		x -= velocidadeX
	
	if(indoC == true):
		x += velocidadeX

	if(indoE == true):
		y += velocidadeY
		
	if(indoD == true):
		y -= velocidadeY
		
	if($Dinheiro.position.y >= 600): # Ao bater em baixo da tela
		indoE = false
		indoD = true

	if($Dinheiro.position.x <= 30): # Ao bater na esquerda da tela
		indoC = true
		indoB = false
		
	if($Dinheiro.position.x >= 990): # Ao bater na direita da tela
		indoC = false
		indoB = true
		
	if ($Dinheiro.position.y <= 22): # Ao bater em cima da tela
		indoD = false
		indoE = true
		
	$Dinheiro.position.x = x # Momento onde o codigo atualiza o X da sprite_Dinheiro para o valor atual da variavel x
	$Dinheiro.position.y = y # Momento onde o codigo atualiza o Y da sprite_Dinheiro para o valor atual da variavel y
	print(x,";",y, " IndoE:", indoE," IndoB:",indoB," IndoD:",indoD," IndoC:",indoC) # !! Extremamente importante, linha que atualiza os estados das variaveis no termial, sem ele esse codigo NAO IA SAIR !! 
	# Sempre somente duas chaves seram verdadeiras

	
	pass





func _on_Voltar_button_up():
	
	get_tree().change_scene("res://main.tscn")
	
