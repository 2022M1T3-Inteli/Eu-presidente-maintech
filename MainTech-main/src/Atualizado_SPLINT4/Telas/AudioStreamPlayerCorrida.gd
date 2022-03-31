extends AudioStreamPlayer

var a = 0

func _ready() -> void:
	var audioStream: AudioStreamSample = preload("res://music//sambaminigame1.wav")
	self.set_stream(audioStream)
	self.set_volume_db(-15)
	if(Global.mute != true):
		self.play()

