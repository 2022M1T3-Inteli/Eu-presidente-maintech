extends AudioStreamPlayer
func _ready() -> void:
	var audioStream: AudioStreamSample = preload("res://music//mainmusica.wav")
	self.set_stream(audioStream)
	self.set_volume_db(3.0)
	if Global.musica:
		self.play()
		
func _process(delta):
	if(get_parent().porta1 == false) or (get_parent().falas == true):
		volume_db = -6
	else:
		volume_db = -2
