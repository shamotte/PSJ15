extends Control

func _on_exit_pressed():
	get_tree().quit()


func _on_combined_pressed():
	get_tree().change_scene_to_file("res://scenes/combined_scenes.tscn")
