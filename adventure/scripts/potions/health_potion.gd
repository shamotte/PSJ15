extends DrinkablePotion

func drink(user : Node2D):
	print("health potiion")
	var node = user.get_node_or_null("CompHealth")
	if node != null:
		node.heal(2)
