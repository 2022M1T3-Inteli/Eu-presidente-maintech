extends KinematicBody2D

export var rapidez := 100
var velocidade := Vector2.ZERO
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _physics_process(delta):
	var direcao_horizontal = (
		Input.get_action_strength("ui_right")
		- Input.get_action_strength("ui_left")
	)
	velocidade.x = direcao_horizontal * rapidez
	
	var direcao_vertical = (
		Input.get_action_strength("ui_baixo")
		- Input.get_action_strength("ui_cima")
	)
	velocidade.y = direcao_vertical * rapidez
	velocidade = move_and_slide(velocidade, velocidade)
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
