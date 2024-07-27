extends ThrowablePotion





func shatter():
	var affected_objects := get_overlaping_objects()
	for obj in affected_objects:
		obj.get_node(receiver).interacted(self)
