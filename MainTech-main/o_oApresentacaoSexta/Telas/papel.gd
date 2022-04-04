extends AudioStreamPlayer

func _ready():
	var audioStream: AudioStreamSample = preload("res://music//mainmusica.wav")
	self.set_stream(audioStream)
	self.set_volume_db(3.0)



func _on_A_button_down():
	if Global.som:
		self.play()
