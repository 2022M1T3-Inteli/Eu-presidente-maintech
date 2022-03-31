extends KinematicBody2D

export var indo = true #Variável booleana: TRUE se o bloco esta se movendo para direita.
export var parado = false #Variável booleana: FALSE se o bloco está se mexendo.
export var velocidade = Vector2(0,0) # Variável criada para iniciar a "gravidade" quando necessário.
export var frames = 0
export var CSX = 0
export var CSY = 0

func _process(delta):
	$AnimatedSprite.frame = frames
	$CollisionShape2D.scale.x = CSX
	$CollisionShape2D.scale.y = CSY
	if Global.final3:
		$".".visible = false
	if parado == false: #Começa o movimento do bloco se movendo 2 unidades para a direita.
		if indo:
			position.x += 2
		if position.x == 1024: #Se chegar no limite definido como 1024, ele volta -2 unidades.
			indo = false		#Criando o movimento de ida e volta
		if indo == false:
			position.x -= 2
		if position.x == 30:
			indo = true


	if Input.is_action_pressed("ui_esp"): #Se espaço for apertado, então a variável parado vira TRUE,
		parado = true						# parando todo o movimento descrito anteriormente.

func _physics_process(delta):		#Ativa a "gravidade" do game, puxando o bloco para baixo adicionando velocidade ao eixo y.
	if parado:
		velocidade.y += 10 
		move_and_slide(velocidade)

