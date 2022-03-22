extends KinematicBody2D

var indo = true
var parado = false
var velocidade = Vector2(0,0)



func _process(delta):

	if parado == false:
		if indo:
			position.x += 2
		if position.x == 1024:
			indo = false
		if indo == false:
			position.x -= 2
		if position.x == 30:
			indo = true


	if Input.is_action_pressed("ui_esp"):
		parado = true

func _physics_process(delta):
	if parado:
		velocidade.y += 10 
		move_and_slide(velocidade)
