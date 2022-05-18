extends AudioStreamPlayer

func _ready():
	var audioStream: AudioStreamSample = preload("res://music//btn2.wav")
	self.set_stream(audioStream)
	self.set_volume_db(3.0)

func _on_Consulta_button_up():
		if Global.som:
			play()
