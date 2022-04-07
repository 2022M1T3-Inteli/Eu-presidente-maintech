extends Node

var sombotao = load("res://music/botaomenu.wav")
var musmenu = load("res://music/menumusica.wav")

func _ready():
	pass # Replace with function body.

func play_music():
	
	if Global.som:
		$Music.stream = sombotao
		$Music.play()
	
func play_music2():
	
	if Global.som:
		$Music2.stream = musmenu
		$Music2.play
