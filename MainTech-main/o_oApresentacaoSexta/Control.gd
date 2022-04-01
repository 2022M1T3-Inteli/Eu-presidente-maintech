extends Control

var falas = [
	"Prazer, " + Global.nomePessoa +"! Eu sou a sua assessora!",
	"Agora que você assumiu oficialmente o cargo de presidente, muitos desafios aparecerão pelo caminho, mas não se preocupe porque eu sempre estarei aqui para ajudar!",
	"Realizamos um relatório dos problemas nacionais e os principais são: MÁ QUALIDADE DO ENSINO SUPERIOR PÚBLICO e INSUFICIÊNCIA DO ABASTECIMENTO DE ENERGIA ELÉTRICA",
	"Além das grandes dificuldades no cenário econômico e na disponibilidade de recursos. É necessário tratar desses problemas antes de qualquer coisa!",
	
	
	]
export var vai = true
export var a = 0
export var quebraLinha = true

func _process(delta):
	if(vai == true):
		$Label.text = falas [a]
		#$Label/AnimationPlayer.play("intro1")


func _ready():
	$Label.autowrap = quebraLinha
	$Label.text = falas [0]
	$Label/AnimationPlayer.play("intro1")
	vai = false
	if Global.personagem == 1:
		$Presidente3.texture = load("res://imag/CardsNovos/President_1/Presidente_3.png")
	elif Global.personagem == 2:
		$Presidente3.texture = load("res://imag/CardsNovos/President_1/Presidente_1.png")
	elif Global.personagem == 3:
		$Presidente3.texture = load("res://imag/CardsNovos/President_1/Presidente_2.png")
	elif Global.personagem == 4:
		$Presidente3.texture = load("res://imag/CardsNovos/President_1/Presidente_4.png")
	else: print("Erro, Control: nem um personagem selecionado")
		
	#print (falas[1])
	



