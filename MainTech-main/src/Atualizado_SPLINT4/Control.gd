extends Control

var falas = [
	"Agora que você já está com mais experiência em seu ofício, chegou a hora de aprender a propor uma Emenda constitucional!",
	"As Propostas de Emendas Constitucionais são mudanças, incrementos ou exclusões na Constituição Federal.                                                                Você só não pode mexer nas " + "Cláusulas Pétreas;",
	"Finalmente, o país está em condições para a construção da obra pública. Assim, o Governo Federal poderá propor uma solução para um dos dois principais problemas "+"/n"+"da nação: a baixo qualidade do ensino superior público ou a crise de eletricidade nacional.",
	"A distribuição de energia elétrica de uma cidade é de responsabilidade da prefeitura, e, portanto, o presidentenão pode interferir nesse cenário!",
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
	$Label.text = falas [0]
	$Label/AnimationPlayer.play("intro1")
	vai = false
	#print (falas[1])
	
	pass
	 



