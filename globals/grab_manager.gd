extends Node2D

var currently_grabbing: Node = null

var mouse_grab: bool = false
var mouse_grab_offset: Vector2

func _ready():
	pass

func _physics_process(delta):
	
	if mouse_grab:
		
		Input.set_default_cursor_shape(Input.CURSOR_DRAG)
		
		if Input.is_action_just_released("craft_grab"):
			mouse_grab = false
		
		var pos := get_viewport().get_mouse_position() - mouse_grab_offset
		currently_grabbing.get_parent().set_global_position(round(pos))
		
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
