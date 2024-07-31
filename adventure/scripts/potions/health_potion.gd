extends DrinkablePotion

func drink(user : Node2D):
	print("health potiion")
	var node = user.get_node_or_null("CompHealth")
	if node != null:
		print("aaaa")
		node.heal(2)
