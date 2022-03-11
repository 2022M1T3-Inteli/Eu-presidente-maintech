extends Node2D

var x = 50
var y = 0
var bateuD = false
var bateuE = true
var lateral = true
var caindo = false
var fundo = 560

func ready():
	pass

func _process(delta):
	$Tijolo.position.x = x
	$Tijolo.position.y = y
	if lateral == true:
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
	elif caindo == true:
		y = y + 4
	if y == fundo:
		caindo = false
		fundo = fundo - 104
	if Global.botao == true:
		lateral = false
		caindo = true
		Global.botao = false
	if lateral == false and caindo == false:
		Global.baixo = true
	if Global.baixo:
		Global.conta += 1
	pass
	
