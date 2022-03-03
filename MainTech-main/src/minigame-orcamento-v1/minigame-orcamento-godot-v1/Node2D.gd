extends Node2D

var orcamento = [] 
var rng = RandomNumberGenerator.new()
var aleatorios_x = []
var aleatorios_y = []
var contador_de_pontos = 0

func _ready():
	orcamento.append($dinheiro1)
	orcamento.append($dinheiro2)
	orcamento.append($dinheiro3)
	orcamento.append($dinheiro4)
	# armazena todos os nodes de dinheiro na lista orcamento, nas posições de 1 a 4

func _process(delta):
	
	for i in range(0, 4): # cria um laço que repete os comandos abaixo 4 vezes
		rng.randomize() # gera um número aleatório
		var aleatorio_x = rng.randi_range($dinheiro1.x*2,$dinheiro1.x*5) # armazena esse valor na variável aleatorio_x
		rng.randomize() # gera outro número aleatório
		var aleatorio_y = rng.randi_range(2, 5) # armazena esse valor na variável aleatorio_y
		aleatorios_x.append(aleatorio_x) # adiciona o valor aleatorio_x na lista aleatrios_x
		aleatorios_y.append(aleatorio_y) # adiciona o valor aleatorio_x na lista aleatrios_y
		orcamento[i].move_local_x(aleatorios_x[i]) # define o valor na posição "i" da lista aleatorios_x como a velocidade no eixo x do item na posição "i" na lista orcamentos
		orcamento[i].move_local_y(aleatorios_y[i]) # define o valor na posição "i" da lista aleatorios_y como a velocidade no eixo y do item na posição "i" na lista orcamentos
		
	

func _on_dinheiro1_body_entered(body): #função que é executada caso um body entre na área do dinheiro1
	if body.name == "player": # verifica se apenas o player, e não outros corpos, encostar no dinheiro1
		contador_de_pontos += 1 # contador de pontos aumenta em uma unidade
		$"dinheiro1/shape-dinheiro1".queue_free() # exclui a possibilidade de colidir com o dinheiro1
		$dinheiro1.visible = false # torna o dinheiro1 invisível
		print(contador_de_pontos) # retorna o valor do contador no terminal

func _on_dinheiro2_body_entered(body): #função que é executada caso um body entre na área do dinheiro2
	if body.name == "player": # verifica se apenas o player, e não outros corpos, encostar no dinheiro2
		contador_de_pontos += 1 # contador de pontos aumenta em uma unidade
		$"dinheiro2/shape-dinheiro2".queue_free() # exclui a possibilidade de colidir com o dinheiro2
		$dinheiro2.visible = false # torna o dinheiro2 invisível
		print(contador_de_pontos) # retorna o valor do contador no terminal

func _on_dinheiro3_body_entered(body): #função que é executada caso um body entre na área do dinheiro3
	if body.name == "player": # verifica se apenas o player, e não outros corpos, encostar no dinheiro3
		contador_de_pontos += 1 # contador de pontos aumenta em uma unidade
		$"dinheiro3/shape-dinheiro3".queue_free() # exclui a possibilidade de colidir com o dinheiro3
		$dinheiro3.visible = false # torna o dinheiro3 invisível
		print(contador_de_pontos) # retorna o valor do contador no terminal

func _on_dinheiro4_body_entered(body): #função que é executada caso um body entre na área do dinheiro4
	if body.name == "player": # verifica se apenas o player, e não outros corpos, encostar no dinheiro4
		contador_de_pontos += 1 # contador de pontos aumenta em uma unidade
		$"dinheiro4/shape-dinheiro4".queue_free() # exclui a possibilidade de colidir com o dinheiro4
		$dinheiro4.visible = false # torna o dinheiro4 invisível
		print(contador_de_pontos) # retorna o valor do contador no terminal

# só precisa agora do recurso de fazer o dinheiro bater na parede e voltar
# vou copiar e colar os comandos e as instruções para criar essas funções de detectar a entrada de um body em uma area2d em um arquivo txt na mesma pasta
