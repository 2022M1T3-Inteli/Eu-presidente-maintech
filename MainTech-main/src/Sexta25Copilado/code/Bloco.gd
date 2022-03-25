extends Area2D

var x = 50 # x e y iniciais
var y = 0
var bateuD = false # booleanas para ajudar a bater nos cantos
var bateuE = true
var lateral = true # booleanas para alternar entre o modo lateral e o que cai
var caindo = false
var parado = false

func _ready():
	y = Global.yAtualizado

func _process(delta):
	position.x = x #assinala as variaveis a posicao de fato
	position.y = y
	if lateral == true and parado == false: # sistema para andar para o lado e bater 
		if x >= 830:
			bateuD = true
		if bateuD == true:
			x = x - 3
			bateuE = false
		if x <= 10:
			bateuE = true
		if bateuE == true:
			x = x + 3
			bateuD = false
	elif caindo == true: # sistema que cai
		y = y + 4
	if y == Global.fundoy:
		caindo = false
		Global.conta +=1
		if x >= Global.fundox1 and x <= Global.fundox2:
			Global.fundoy = Global.fundoy - 104
			Global.perdeu = false
			Global.fundox1 = x - 100
			Global.fundox2 = x + 100
		elif parado == true:
		#print ("perdeu")
			Global.fundoy = Global.fundoy - 104
			Global.perdeu = true
		#print (x)
	if lateral == false and caindo == false:
		parado = true
		Global.baixo = true
		lateral = true



func _on_Button_button_down():
	lateral = false
	caindo = true
	pass # Replace with function body.
