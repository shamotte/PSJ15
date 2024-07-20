extends Control

func _on_alchemy_pressed():
	get_tree().change_scene_to_file("res://scenes/crafting.tscn")


func _on_adventure_pressed():
	get_tree().change_scene_to_file("res://adventure/scenes/world.tscn")


func _on_exit_pressed():
	get_tree().quit()


func _on_combined_pressed():
	get_tree().change_scene_to_file("res://scenes/combined_scenes.tscn")
