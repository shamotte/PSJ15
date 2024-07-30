extends Control

signal window_closed

func window_active(active : bool):
	$Container.visible = active
	if active == false:
		window_closed.emit()
		
func _on_button_pressed():
	window_active(false)
