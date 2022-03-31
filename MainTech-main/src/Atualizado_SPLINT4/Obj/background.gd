extends ParallaxBackground

func _ready():
	if(Global.skinsGames == "floresta"):
		$"bakground-layer/background-layer-sprite".texture = load("res://imag/BG/minigame-corrida-floresta.jpg")
		
func _process(delta):
	scroll_offset.y += Global.velocidade
