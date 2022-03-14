extends Area2D

var x = 50 # x e y iniciais
var y = 0
var bateuD = false # booleanas para ajudar a bater nos cantos
var bateuE = true
var lateral = true # booleanas para alternar entre o modo lateral e o que cai
var caindo = false
var parado = false

func ready():
	pass
	
func _process(delta):
	position.x = x #assinala as variaveis a posicao de fato
	position.y = y
	if lateral == true and parado == false: # sistema para andar para o lado e bater 
		if x >= 1000:
			bateuD = true
		if bateuD == true:
			x = x - 3
			bateuE = false
		if x <= 40:
			bateuE = true
		if bateuE == true:
			x = x + 3
			bateuD = false
	elif caindo == true: # sistema que cai
		y = y + 4
	if y == Global.fundo:
		caindo = false
		Global.fundo = Global.fundo - 104
	if lateral == false and caindo == false:
		parado = true
		Global.baixo = true
		lateral = true



func _on_Button_button_down():
	lateral = false
	caindo = true
	pass # Replace with function body.
