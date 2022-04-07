extends AudioStreamPlayer

var conta = 0

func _ready() -> void:
	var audioStream: AudioStreamSample = preload("res://music//mainmusica.wav")
	self.set_stream(audioStream)
	self.set_volume_db(3.0)
	if Global.musica:
		self.play()
		
		
func _process(delta):
	if(get_parent().porta1 == false):
		volume_db = -6
	else:
		volume_db = -2
	if get_parent().falas == true:
		stop()
		conta = 1
	else:
		if(conta > 0):
			play()
			conta = 0
	#print(conta)
