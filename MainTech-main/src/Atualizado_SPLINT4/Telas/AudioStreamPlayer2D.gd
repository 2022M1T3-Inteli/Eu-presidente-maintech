extends AudioStreamPlayer2D

func _ready() -> void:
	var audioStream: AudioStreamSample = preload("res://music//menumusica.wav")
	self.set_stream(audioStream)
	self.set_volume_db(3.0)
	self.play()
