extends AudioStreamPlayer

func _ready():
	var audioStream: AudioStream = preload("res://music//sompapel.mp3")
	self.set_stream(audioStream)
	self.set_volume_db(3.0)

func play(from_position=0.0):
	
	randomize()
	pitch_scale = rand_range(0.75, 1.5)
	
	.play(from_position)

func _on_Positivo_button_up():
	if Global.som:
		play()

func _on_Negativo_button_up():
	if Global.som:
		play()
