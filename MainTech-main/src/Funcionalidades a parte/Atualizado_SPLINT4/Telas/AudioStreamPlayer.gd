extends AudioStreamPlayer

var a = 0

func _ready() -> void:
	var audioStream: AudioStreamSample = preload("res://music//sambaminigame1.wav")
	self.set_stream(audioStream)
	self.set_volume_db(-15)
	

func _process(delta):
	if(get_parent().tempo_on == true and a <= 0):
		if(Global.mute != true):
			self.play()
			a += 1
	
