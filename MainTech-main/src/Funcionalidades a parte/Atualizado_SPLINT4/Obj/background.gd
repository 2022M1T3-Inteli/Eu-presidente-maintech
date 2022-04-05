extends ParallaxBackground

export var texturas:Texture = load("res://imag/BG/MineGAmeCorrida.jpg")

func _ready():
	if(Global.skinsGames == "floresta"):
		texturas = load("res://imag/MineGameCorrida/minigame-corrida-floresta.jpeg")
	else:
		texturas = load("res://imag/BG/MineGAmeCorrida.jpg")
	$"bakground-layer/background-layer-sprite".texture = texturas
func _process(delta):
	scroll_offset.y += Global.velocidade
