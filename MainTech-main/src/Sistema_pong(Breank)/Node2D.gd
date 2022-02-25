extends Node2D


# Declare member variables here. Examples:
# var a = 2
var posicaoInicial = Vector2(500,300)
var x = 1
var y = 1
var indoD = false
var indoE = false
var indoC = false
var indoB = false


# Called when the node enters the scene tree for the first time.
func _ready():
	indoD = true
	$Dinheiro.position = posicaoInicial
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(indoB == true):
		x -= 1
		y += 1
	
	if(indoC == true):
		x += 1
		y -= 1

	if(indoE == true):
		x += 1
		y += 1
		
	if(indoD == true):
		x -= 1
		y -= 1
		
	if($Dinheiro.position.y >= 200 and $Dinheiro.position.x >= 200):
		indoE = false
		indoC = true
		
		
	if($Dinheiro.position.x <= -200 and $Dinheiro.position.y <= -200  ):
		indoE = true
		indoC = false
		
	if($Dinheiro.position.x <= -200 and $Dinheiro.position.y <= -200  ):
		print("aqui <=-200")
		indoE = true
		indoD = false
		pass
	if($Dinheiro.position.x >= 200 and $Dinheiro.position.y >= 200  ):
		indoB = false
		indoC = true
		print("B_f , C_t")
		pass
		
	if ($Dinheiro.position.y >= -200 and $Dinheiro.position.x >= 200):
		indoD = false
		indoB = true
	
	if($Dinheiro.position.x <= -200 and $Dinheiro.position.y >= 200):
		indoB = false
		indoC = true

	$Dinheiro.position.x = x
	$Dinheiro.position.y = y
	print(x,";",y,"IndoE:", indoE,"IndoB:", indoB, "IndoD:", indoD, "IndoC:", indoC)
	

	
	pass
