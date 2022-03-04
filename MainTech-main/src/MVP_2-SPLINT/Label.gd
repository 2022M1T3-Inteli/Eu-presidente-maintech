extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for i in 7:
		var x = 0.5 * i - 1.5
		print("%4.1f %4.1f %4.1f" % [x, fmod(x, 1.5), fposmod(x, 1.5)])


	pass # Replace with function body.


