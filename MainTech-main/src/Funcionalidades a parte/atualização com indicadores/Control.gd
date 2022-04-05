extends Control

var textos = ["Agora que você já está com mais experiência em seu ofício, chegou a hora de aprender a propor uma Emenda constitucional!","As Propostas de Emendas Constitucionais são mudanças, incrementos ou exclusões na Constituição Federal.", "Texto exemplo"]


func _process(delta):
	pass

func _ready():
	$Label.text = textos [1]
	$Label/AnimationPlayer.play("intro1")
	print (textos[1])
	
	pass
	 



