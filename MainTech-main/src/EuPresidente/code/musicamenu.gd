extends AudioStreamPlayer

func _ready() -> void:
	var audioStream: AudioStreamSample = preload("res://music//menumusica.wav")
	self.set_stream(audioStream)
	self.play()
	if(Global.musica != true):
		self.set_volume_db(-100)
