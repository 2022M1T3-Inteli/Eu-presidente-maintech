extends KinematicBody2D


func _ready():
	if(Global.skinsGames == "floresta"):
		$"player-sprite".texture = load("res://imag/MineGameCorrida/jeep-removebg-preview.png")
func _physics_process(delta):
	movimento_player()
	if Global.gameover:
		morte_player()
	

func movimento_player(): # função de movimento do player
	if Input.is_action_just_pressed("ui_right"): # o que acontece se o player apertar o botão de ir para a direita
		if $".".position.x == 512:
			$".".position.x = 780 # caso o player se encontre no trilho do meio, ele irá para o trilho da direita
		elif $".".position.x == 246:
			$".".position.x = 512 # caso o player se encontre no trilho da esquerda, ele irá para o trilho do meio
	if Input.is_action_just_pressed("ui_left"): # o que acontece se o player apertar o botão de ir para a direita
		if $".".position.x == 512:
			$".".position.x = 246 # caso o player se encontre no trilho do meio, ele irá para o trilho da esquerda
		elif $".".position.x == 780:
			$".".position.x = 512 # caso o player se encontre no trilho da direita, ele irá para o trilho do meio
	else:
		$"player-sprite".frame = 0

func morte_player():
	$".".queue_free()
