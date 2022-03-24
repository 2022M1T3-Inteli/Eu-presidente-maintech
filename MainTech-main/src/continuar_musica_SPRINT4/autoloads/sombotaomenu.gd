extends Node

var sombotao = load("res://music/botaomenu.wav")

func _ready():
	pass # Replace with function body.

func play_music():
	
	$Music.stream = sombotao
	$Music.play()
