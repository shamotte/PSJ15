extends Node2D

var currently_grabbing: Node = null

var mouse_grab: bool = false
var mouse_grab_offset: Vector2

func average_position(nodes: Array):
	var pos_avg = Vector2.ZERO
	for n in nodes:
		pos_avg += n.position
	pos_avg /= nodes.size()
	return pos_avg

func sort_nodes_by_name(a: Node, b: Node):
	return str(a.get_name()) < str(b.get_name())

var crafting = {
	"Eyes+Mushrooms": func(components: Array):
		var pos_avg = average_position(components)
		var tree = components[0].get_parent()
		
		for comp in components:
			comp.queue_free()
			
		var eyeshrooms = load("res://Table/objects/eyeshrooms.tscn")
		var e = eyeshrooms.instantiate()
		e.position = pos_avg
		tree.add_child(e),
		
	"Candle+FairyCandy": func(components: Array):
		var pos_avg = average_position(components)
		var tree = components[0].get_parent()
		
		components[1].queue_free()
		
		var hell_candy = load("res://Table/objects/hell_candy.tscn")
		var h = hell_candy.instantiate()
		h.position = pos_avg
		tree.add_child(h),
		
	"Candle+Mushrooms": func(components: Array):
		var pos_avg = average_position(components)
		var tree = components[0].get_parent()
		
		components[1].queue_free()
		
		var burnshrooms = load("res://Table/objects/burnshrooms.tscn")
		var b = burnshrooms.instantiate()
		b.position = pos_avg
		tree.add_child(b),
}

func _ready():
	pass

func _physics_process(delta):
	
	if mouse_grab:
		
		Input.set_default_cursor_shape(Input.CURSOR_DRAG)
		
		var pos := get_viewport().get_mouse_position() - mouse_grab_offset
		currently_grabbing.get_parent().set_global_position(round(pos))
		
		if Input.is_action_just_released("craft_grab"):
			mouse_grab = false
			
			var overlap_areas = currently_grabbing.grab_area.get_overlapping_areas()
			overlap_areas.append(currently_grabbing.grab_area)
			
			var overlap = []
			var overlap_names = []
			for oa in overlap_areas:
				overlap.append(oa.get_parent())
				overlap_names.append(str(oa.get_parent().item_name))

			overlap.sort_custom(sort_nodes_by_name)
			overlap_names.sort()
			
			var overlap_key = "+".join(overlap_names)
			
			print(overlap_key, overlap)
			
			if (overlap_key in crafting.keys()):
				crafting[overlap_key].call(overlap)
		
	else:
		
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
			
		var grabbables = get_tree().get_nodes_in_group("comp_grabbable")
		grabbables.sort_custom(sort_by_tree_index)
		for grabbable in grabbables:
			if grabbable.mouse_hovering:
				
				Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
				
				if Input.is_action_just_pressed("craft_grab"):
					mouse_grab = true
					currently_grabbing = grabbable
					mouse_grab_offset = get_viewport().get_mouse_position() - currently_grabbing.grab_area.get_global_position()
					currently_grabbing.get_parent().get_parent().move_child(currently_grabbing.get_parent(), -1) # Move to top of list
					break
				
		
			
	
func sort_by_tree_index(a, b):
	return a.get_parent().get_index() > b.get_parent().get_index()
