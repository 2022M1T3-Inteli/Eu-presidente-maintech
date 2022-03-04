extends Area2D


# Declare member variables here. Examples:





func _process(delta):
	seguirMouse()
	if(Input.is_action_pressed("ui_click")):
		$Sprite.frame = 0
	else:
		$Sprite.frame = 1


func seguirMouse():
	var mX
	var mY
	mX = get_viewport().get_mouse_position().x
	mY = get_viewport().get_mouse_position().y
	position.x = mX
	position.y = mY
