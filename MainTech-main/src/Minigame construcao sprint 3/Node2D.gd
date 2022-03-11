extends Node2D
# Declar"res://Bloco.tscn"e member variables here. Examples:
# var a = 2
# var b = "text"
# Called when the node enters the scene tree for the first time.
func _ready():
	criaBloco()
	pass # Replace with function body.

func criaBloco():
	var blocoload = get_child(1).duplicate(1)
		#var blocoload = preload("res://Bloco.tscn")
	#var bloco = blocoload.instance()
	get_parent().add_child(blocoload)
	print("bloco")
	pass

func _process(delta):
	#print(Global.botao)
	if Global.baixo == true:
		print("entrou")
		criaBloco()
		#yield(get_tree().create_timer(1),"timeout")
		Global.baixo = false
	pass

func _on_Button_button_down():
	Global.botao = true
	pass # Replace with function body.
