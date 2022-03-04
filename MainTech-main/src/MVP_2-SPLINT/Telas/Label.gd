extends Label

export var tempo = 3
var tempo_on = true

func _process(delta):
	if (tempo <= 0):
		tempo_on = false
		text = "00" + ":" + "00"
		yield(get_tree().create_timer(0.5),"timeout")
		get_tree().change_scene("res://Telas/main.tscn")
		
		
	if(tempo_on):
		tempo -= delta
		text = "00" + ":" + str(int(tempo))
