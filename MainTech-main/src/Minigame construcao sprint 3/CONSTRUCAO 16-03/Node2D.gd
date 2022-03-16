extends Node2D
# nada nesse script funciona. Help.
onready var blocoload 
onready var bloco 

func criaBloco():
	blocoload = preload("res://Bloco.tscn")
	bloco = blocoload.instance()
	get_parent().add_child(bloco)

func _ready():
	criaBloco()
	$Label.visible = false
	pass # Replace with function body.

func _process(delta):
	if Global.perdeu:
		$Label.visible = true
		bloco.visible = false
	if Global.baixo == true:
		criaBloco()
		Global.baixo = false	
	#$Camera2D.position = lerp($Camera2D.position, bloco.position, 0.05)
		

