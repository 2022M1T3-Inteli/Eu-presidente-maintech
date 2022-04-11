extends ParallaxBackground

export var texturas:Texture = load("res://Minigame2/Imagens2/fundoEstrada.jpg")

func _ready():
	if(Global.skinsGames == "floresta"):
		texturas = load("res://Minigame2/Imagens2/fundoFloresta.jpg")
	else:
		texturas = load("res://Minigame2/Imagens2/fundoEstrada.jpg")
	$"bakground-layer/background-layer-sprite".texture = texturas
func _process(delta):
	scroll_offset.y += Global.velocidade
