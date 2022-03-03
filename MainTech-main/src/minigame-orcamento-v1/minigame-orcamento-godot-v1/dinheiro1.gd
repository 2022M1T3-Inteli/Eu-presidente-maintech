extends Area2D


# Declare member variables here. Examples:
var x = -1
var y = -1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".move_local_x(4)
	$".".move_local_y(3)
#	pass
