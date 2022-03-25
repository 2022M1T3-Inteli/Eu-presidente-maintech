extends Node2D
# nada nesse script funciona. Help.
onready var blocoload 
onready var bloco 

func criaBloco():
	blocoload = preload("res://Obj/Bloco.tscn")
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
		if(Global.conta > Global.alturaM):
			Global.alturaM += 1
			Global.yAtualizado -= 80
			$Camera2D.position.y -= 30
		print(Global.yAtualizado)
		Global.baixo = false	
		
		

