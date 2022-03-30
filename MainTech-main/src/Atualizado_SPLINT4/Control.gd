extends Control

var textos = ["Agora que você já está com mais experiência em seu ofício, chegou a hora de aprender a propor uma Emenda constitucional!","As Propostas de Emendas Constitucionais são mudanças, incrementos ou exclusões na Constituição Federal.", "Texto exemplo"]
export var vai = true
export var a = 0
export var quebraLinha = true

func _process(delta):
	if(vai == true):
		$Label.text = textos [a]
		$Label/AnimationPlayer.play("intro1")
		vai = false

func _ready():
	$Label.autowrap = quebraLinha
	$Label.text = textos [1]
	$Label/AnimationPlayer.play("intro1")
	vai = false
	print (textos[1])
	
	pass
	 



