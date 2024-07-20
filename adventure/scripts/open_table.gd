extends Node2D

func switch():
	get_tree().get_root().get_node("world_manager").change_to_crafting()
	
func show_tip(show : bool):
	$PressE.visible = show
	
