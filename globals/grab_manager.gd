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
	
	"Knife+Mushrooms": func(components: Array):
		var pos_avg = components[1].position
		var tree = components[1].get_parent()
		components[1].queue_free()
			
		var scene = load("res://Table/objects/cut_mushrooms.tscn")
		var e = scene.instantiate()
		e.position = pos_avg
		tree.add_child(e),
		
	"Mushrooms+Fire": func(components: Array):
		var pos_avg = components[0].position
		var tree = components[0].get_parent()
		
		components[0].queue_free()
		
		var burnshrooms = load("res://Table/objects/burnshrooms.tscn")
		var b = burnshrooms.instantiate()
		b.position = pos_avg
		tree.add_child(b),
		
	"FairyCandy+Fire": func(components: Array):
		var pos_avg = components[0].position
		var tree = components[0].get_parent()
		components[0].queue_free()
		
		var hell_candy = load("res://Table/objects/hell_candy.tscn")
		var h = hell_candy.instantiate()
		h.position = pos_avg
		tree.add_child(h),
	
	"Eyes+Mushrooms": func(components: Array):
		var pos_avg = average_position(components)
		var tree = components[0].get_parent()
		
		for comp in components:
			comp.queue_free()
			
		var eyeshrooms = load("res://Table/objects/eyeshrooms.tscn")
		var e = eyeshrooms.instantiate()
		e.position = pos_avg
		tree.add_child(e),
		
	"Eyes+Mortar": func(components: Array):
		var pos_avg = components[0].position
		var tree = components[0].get_parent()
		components[0].queue_free()
			
		var scene = load("res://Table/objects/eye_jelly.tscn")
		var e = scene.instantiate()
		e.position = pos_avg
		tree.add_child(e),
		
	"Eyeple+Knife": func(components: Array):
		var pos_avg = components[0].position
		var tree = components[0].get_parent()
		components[0].queue_free()
			
		var scene = load("res://Table/objects/eyeple_slices.tscn")
		var e = scene.instantiate()
		e.position = pos_avg
		tree.add_child(e),
		
	"CutMushrooms+EyepleSlices": func(components: Array):
		var pos_avg = average_position(components)
		var tree = components[0].get_parent()
		for comp in components:
			comp.queue_free()
			
		var scene = load("res://Table/objects/sauce.tscn")
		var e = scene.instantiate()
		e.position = pos_avg
		tree.add_child(e),
		
	"Eyeshrooms+Firefly": func(components: Array):
		var pos_avg = average_position(components)
		var tree = components[0].get_parent()
		for comp in components:
			comp.queue_free()
			
		var scene = load("res://Table/objects/mushroom_lamp.tscn")
		var e = scene.instantiate()
		e.position = pos_avg
		tree.add_child(e),
		
	"FairyCandy+Firefly": func(components: Array):
		var pos_avg = average_position(components)
		var tree = components[0].get_parent()
		for comp in components:
			comp.queue_free()
			
		var scene = load("res://Table/objects/firefly_candy.tscn")
		var e = scene.instantiate()
		e.position = pos_avg
		tree.add_child(e),
		
	
	
	
	"EmptyBottle+JadeEye": func(components: Array):
		var pos_avg = average_position(components)
		var tree = components[0].get_parent()
		
		for comp in components:
			comp.queue_free()
			
		var eyebottle = load("res://Table/objects/eye_bottle.tscn")
		var e = eyebottle.instantiate()
		e.position = pos_avg
		tree.add_child(e),
}

func _ready():
	pass

func _physics_process(delta):
	
	# Reset grabbable modulate
	for g in get_tree().get_nodes_in_group("comp_grabbable"):
		g.get_parent().modulate = Color.WHITE
	
	if mouse_grab:
		
		Input.set_default_cursor_shape(Input.CURSOR_DRAG)
		
		var pos := get_viewport().get_mouse_position() - mouse_grab_offset
		currently_grabbing.get_parent().set_global_position(round(pos))
		
		# Highlingt things in collision
		var overlap_areas = currently_grabbing.grab_area.get_overlapping_areas()
		#print(overlap_areas)
		
		var overlap = []
		var overlap_names = []
		
		if currently_grabbing.get_parent().get_node("Comp_Grabbable").can_craft:
			overlap_areas.append(currently_grabbing.grab_area)
			
			for oa in overlap_areas:
				if oa.get_parent().get_node("Comp_Grabbable").can_craft:
					overlap.append(oa.get_parent())
					overlap_names.append(str(oa.get_parent().item_name))

		for o in overlap:
			o.modulate = Color(1.5, 1.5, 1.5, 1.0)
		
		if Input.is_action_just_released("craft_grab"):
			mouse_grab = false
			
			overlap.sort_custom(sort_nodes_by_name)
			overlap_names.sort()
			
			var overlap_key = "+".join(overlap_names)
			
			#print(overlap_key, overlap)
			
			if (overlap_key in crafting.keys()):
				crafting[overlap_key].call(overlap)
		
	else:
		
		Input.set_default_cursor_shape(Input.CURSOR_ARROW)
			
		var grabbables = get_tree().get_nodes_in_group("comp_grabbable")
		grabbables.sort_custom(sort_by_tree_index)
		for grabbable in grabbables:
			if grabbable.mouse_hovering:
				
				Input.set_default_cursor_shape(Input.CURSOR_POINTING_HAND)
				
				if Input.is_action_just_pressed("craft_grab") and grabbable.can_grab:
					mouse_grab = true
					currently_grabbing = grabbable
					mouse_grab_offset = get_viewport().get_mouse_position() - currently_grabbing.grab_area.get_global_position()
					currently_grabbing.get_parent().get_parent().move_child(currently_grabbing.get_parent(), -1) # Move to top of list
					break
				
		
			
	
func sort_by_tree_index(a, b):
	return a.get_parent().get_index() > b.get_parent().get_index()
