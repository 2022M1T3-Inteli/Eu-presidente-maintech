extends Node2D


# Declare member variables here. Examples:
var P = 0
var N = 0
var porta1 = false

# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	P = 0
	N = 0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(P,";",N)
	
	if (P == 0 and N == 0):
		
		porta1 = true
	else:
		porta1 = false
	
	if (porta1 == true):
		$AnimatedSprite.hide()
		
	else: 
		$AnimatedSprite.show()
	
	if(P == 1 and N == 0):
		print("Dentro p1;n0")
		$AnimatedSprite.play("card3")
		pass
	if(P == 1 and N == 2):
		print("Dentro p1;n2")
		$AnimatedSprite.play("card2")
		pass
	if(P == 1 and N == 1):
		print("Dentro p1;n1")
		$AnimatedSprite.play("card1")
		pass
	

func _on_Positivo_button_up():
	P += 1
	pass # Replace with function body.


func _on_Negativo_button_up():
	N += 1
	pass # Replace with function body.


func _on_Reorganizar_button_up():
	N = 0
	P = 0
	pass # Replace with function body.
