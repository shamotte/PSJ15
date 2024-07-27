extends ThrowablePotion




func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_U:
			shater()

func shater():
	var affected_objects := get_overlaping_objects()
	for obj in affected_objects:
		obj.get_node(receiver).interacted(self)
