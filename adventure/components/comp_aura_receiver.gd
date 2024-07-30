extends Area2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var Auras = get_overlapping_areas()
	#interactable object
	if len(Auras) > 0:
		var Component : Area2D = min_distance(Auras)
		if Component.has_method("in_area"):
			Component.in_area(true)
		#Aura
		for i in Auras:
			if Component.has_method("aura"):
				Component.aura(get_parent())

func min_distance(area_array : Array[Area2D] ):
	var min_dist : float = 99999
	var index : Area2D
	for i in area_array:
		var dist : float  =  position.distance_squared_to(i.position)
		if min_dist > dist:
			min_dist = dist
			index = i
	return index
