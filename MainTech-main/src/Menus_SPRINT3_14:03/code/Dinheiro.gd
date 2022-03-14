extends Area2D


var x = 0 # Variavel usada para atualizar a posicao atual do X da sprite_Dinheiro
var y = 0 # Variavel usada para atualizar a posicao atual do Y da sprite_Dinheiro
var velocidadeX = 4 # Numero somado a variavel x
var velocidadeY = 4 # Numero somado a variavel y
onready var indoD = false # Porta, quando verdadeira permite que velocidadeY seja subitraida da variavel y
onready var indoE = false # Porta, quando verdadeira permite que velocidadeY seja somada a variavel y
onready var indoC = false # Porta, quando verdadeira permite que velocidadeX seja subitraida da variavel x
onready var indoB = false # Porta, quando verdadeira permite que velocidadeX seja ssomada a variavel x
onready var portaToque = false # Porta, quando falsa ativa o sistema pong
var rng = RandomNumberGenerator.new()

func _ready():
	# Para que o codigo comece é necessario ao menos duas das portas serem verdadeiras 
	indoB = true # Porta inicial para x
	indoD = true # Porta inicial para y
	rng.randomize()
	velocidadeX = rng.randi_range(4,10)
	rng.randomize()
	velocidadeY = rng.randi_range(4,10)
	rng.randomize()
	x = rng.randi_range(0,800)
	y = rng.randi_range(0,600)
	position.y = x
	position.x = y
	pass # Replace with function body.

func _process(delta):
	
	
	if(portaToque == false): # Validacao para saber se o sistema pong esta ativo, quando ativo entra no if
		if(indoB == true): 
			x -= velocidadeX
		
		if(indoC == true): 
			x += velocidadeX
			
		if(indoE == true): 
			y += velocidadeY
			
		if(indoD == true): 
			y -= velocidadeY
			
		if(position.y >= 564): # Ao bater em baixo da tela
			indoE = false
			indoD = true
		if(position.x <= 0): # Ao bater na esquerda da tela
			indoC = true
			indoB = false
			
		if(position.x >= 964): # Ao bater na direita da tela
			indoC = false
			indoB = true
			
		if (position.y <= 0): # Ao bater em cima da tela
			indoD = false
			indoE = true
			
		position.x = x # Momento onde o codigo atualiza o X da sprite_Dinheiro para o valor atual da variavel x
		position.y = y # Momento onde o codigo atualiza o Y da sprite_Dinheiro para o valor atual da variavel y
		# print(x,";",y, " IndoE:", indoE," IndoB:",indoB," IndoD:",indoD," IndoC:",indoC) # !! Extremamente importante, linha que atualiza os estados das variaveis no termial, sem ele esse codigo NAO IA SAIR !! 
		# Sempre somente duas chaves seram verdadeiras
		#  Desliga todas as portas do sistema pong


	


func _on_Dinheiro_area_entered(area):
	if(area.name == "Mouse"):
		area.get_parent().pontos += 1
		queue_free()
	if (area.name == "Limpador"):
		queue_free()
	pass # Replace with function body.
