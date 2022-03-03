extends Label


var tempo = 0
var tempo_on = true

func _process(delta):
	if(tempo_on):
		tempo += delta
	else:
		acabou()
	var secs = fmod(tempo,60)
	var mins = fmod(tempo,60*60)/60
	
	
	
	var time_passed = "%02d : %02d" % [mins,secs]
	text = time_passed
	pass	
	
	if mins >= 0:
		tempo_on = false
		
func _ready():
	pass 

func acabou():
	pass
	
	



