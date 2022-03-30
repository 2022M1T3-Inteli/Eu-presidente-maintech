extends Control

var falas = [
	"Agora que você já está com mais experiência em seu ofício, chegou a hora de aprender a propor uma Emenda constitucional!",
	"As Propostas de Emendas Constitucionais são mudanças, incrementos ou exclusões na Constituição Federal.                                                                Você só não pode mexer nas " + "Cláusulas Pétreas;",
	 
	]
export var vai = true
export var a = 0
export var quebraLinha = true

func _process(delta):
	if(vai == true):
		$Label.text = falas [a]
		$Label/AnimationPlayer.play("intro1")
		vai = false

func _ready():
	$Label.autowrap = quebraLinha
	$Label.text = falas [1]
	$Label/AnimationPlayer.play("intro1")
	vai = false
	print (falas[1])
	
	pass
	 



