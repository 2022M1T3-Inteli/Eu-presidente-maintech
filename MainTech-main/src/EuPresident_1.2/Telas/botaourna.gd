extends AudioStreamPlayer

func _ready():
	var audioStream: AudioStreamSample = preload("res://music//urna.wav")
	self.set_stream(audioStream)
	self.set_volume_db(3.0)

#func _on_Button_pressed():
		#if Global.som:
			#play()
