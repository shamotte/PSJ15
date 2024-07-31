extends DrinkablePotion

func drink(user : Node2D):
	get_tree().change_scene_to_file("res://scenes/game_win.tscn")
