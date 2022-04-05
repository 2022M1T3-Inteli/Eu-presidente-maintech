extends Area2D

var rng = RandomNumberGenerator.new()
var posicaoColetavel = 0

func _ready():
	rng.randomize()
	posicaoColetavel = rng.randi_range(0, 3) # gera um número aleatório (0, 1 ou 2)
	if posicaoColetavel == 0:
		$".".position.x = 307 # caso a posicaoColetavel for 0, a posição x do coletável será 307
	elif posicaoColetavel == 1:
		$".".position.x = 512 # caso a posicaoColetavel for 1, a posição x do coletável será 512
	else:
		$".".position.x = 716 # caso a posicaoColetavel for 2, a posição x do coletável será 716


func _on_coletavel_body_entered(body):
	if body.name == "player":
		Global.pontuacao += 1
		print(Global.pontuacao)
		queue_free() # caso o player entre na área do coletável, este será excluído da cena

func _process(delta):
	$".".position.y += Global.velocidade
	if $".".position.y > 600:
		queue_free()
	
