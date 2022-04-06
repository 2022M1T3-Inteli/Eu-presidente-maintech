extends Control

var genero = [
	"acessor",
	"acessora"
	]
var falas = [
	"Prazer, " + Global.nomePessoa +"! Chamamos você aqui porque, na noite passada, seu irmão(ã) gêmeo(a), o atual presidente do Brasil, sumiu. Não sabemos onde ele(a) está e, desde então, o país está sem um chefe do Poder Executivo.",
	"Não temos ideia do que aconteceu, mas, para evitar maiores calamidades, decidimos contatar você para assumir oficialmente o cargo de presidente. Assim, podemos manter a estabilidade enquanto trabalhamos para superar essa crise.",
	"Eu era " +genero[0]+" do seu irmão e posso garantir que muitos desafios aparecerão pelo caminho, mas não se preocupe porque eu sempre estarei aqui para ajudar!",
	"Realizamos um relatório dos problemas nacionais e os principais são: MÁ QUALIDADE DO ENSINO SUPERIOR PÚBLICO e INSUFICIÊNCIA DO ABASTECIMENTO DE ENERGIA ELÉTRICA",
	"Além das grandes dificuldades no cenário econômico e na disponibilidade de recursos. É necessário tratar desses problemas antes de qualquer coisa!",
	"Para facilitar, vamos dividir o trabalho em três partes: ORÇAMENTO PÚBLICO, QUESTÃO AMBIENTAL e CONSTRUÇÃO DA OBRA PÚBLICA",
	"Para fazer as mudanças necessárias, você precisará adotar medidas que envolvem decisões. Escolha bem, o futuro do país depende delas!",
	"Clique na papelada em sua mesa para iniciar. Todas as propostas terão duas possíveis decisões. Use seu entendimento e as dicas e instruções do jogo para avançar!",
	
	"Para ser possível realizar uma obra pública que supra as necessidades da população, é necessário desenvolver um modo de reduzir os gastos públicos.",
	
	"Agora que você já está com mais experiência em seu ofício, chegou a hora de aprender a propor uma Emenda Constitucional!",
	"Elas são mudanças, incrementos ou exclusões na Constituição Federal. Você só não pode mexer nas Cláusulas Pétreas;",
	
	"IMPORTANTE! Segundo a Legislação Brasileira, o presidente não deve interferir no cenário municipal! As Instabilidades do município são de responsabilidade da prefeitura.",
	
	"A distribuição de energia elétrica de uma cidade é de responsabilidade da prefeitura, e, portanto, o presidente não pode interferir nesse cenário!",
	"Para realizar as mudanças necessárias, você deve se comunicar com os órgãos municipais, como a câmara municipal, fazendo uma proposta a um dos vereadores.",
	"As eleições municipais acontecerão em breve, então você poderá escolher um dos candidatos a vereador para propor a ideia de melhorar a distribuição de eletricidade no município.",
	
	"Devido ao quociente eleitoral, o candidato do seu partido assumiu o cargo, porém, mesmo recebendo mais votos, o outro concorrente, que seria um possível parceiro, não foi eleito.",
	
	"Finalmente, o país está em condições para a construção de uma obra pública. O Governo Federal poderá propor uma solução para um dos dois principais problemas da nação: a baixa qualidade do ensino superior público ou a crise de eletricidade nacional.",
	
	]

signal p 
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
	else: print("Erro, Control: nenhum personagem selecionado")
		
	#print (falas[1])
	





func _on_Control_p():
	$Label/AnimationPlayer.play("intro1")
