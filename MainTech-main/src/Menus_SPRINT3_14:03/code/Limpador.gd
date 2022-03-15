extends Area2D

var v = 20
var limpa_on = false

func _ready():
	limpa_on = true

func _process(delta):
	if(limpa_on == true):
		position.x += v
	else:
		$CollisionShape2D.disabled = true
	if (position.x >= 1080):
		queue_free()
