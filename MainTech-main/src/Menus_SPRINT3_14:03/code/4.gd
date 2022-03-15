extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_4_mouse_entered():
	print("Boa")
	$anim4.frame = 1
	pass # Replace with function body.


func _on_4_mouse_exited():
	$anim4.frame = 0
	pass # Replace with function body.
