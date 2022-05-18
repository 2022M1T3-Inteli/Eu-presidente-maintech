extends Area2D

func _process(delta):
	seguirCursor()
	if(Input.is_action_pressed("ui_click")):
		$Sprite.frame = 0
	else:
		$Sprite.frame = 1


func seguirCursor():
	var cursorX # Mouse x
	var cursorY # Mouse y
	cursorX = get_viewport().get_mouse_position().x
	cursorY = get_viewport().get_mouse_position().y
	position.x = cursorX
	position.y = cursorY


func _on_Mouse_area_entered(area):
	var a = InputEventAction.new()
	a.action = "ui_click"
	a.pressed = true
	Input.parse_input_event(a)
	yield(get_tree().create_timer(0.2),"timeout")
	a.pressed = false
	Input.parse_input_event(a)
