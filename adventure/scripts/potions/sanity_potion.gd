extends DrinkablePotion

func drink(user : Node2D):
	var node = user.get_node_or_null("CompSanity")
	if node != null:
		node.increase_sanity(120)
