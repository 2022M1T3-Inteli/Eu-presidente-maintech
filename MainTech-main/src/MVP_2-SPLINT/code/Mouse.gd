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


func _on_Mouse_area_entered(area):
	var a = InputEventAction.new()
	a.action = "ui_click"
	a.pressed = true
	Input.parse_input_event(a)
	yield(get_tree().create_timer(0.2),"timeout")
	a.pressed = false
	Input.parse_input_event(a)
