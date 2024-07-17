extends Node2D

@export var grab_area: Node

var mouse_grab: bool = false
var mouse_grab_offset: Vector2

var mouse_hovering: bool = false

func _ready():
	grab_area.connect("mouse_entered", mouse_entered)
	grab_area.connect("mouse_exited", mouse_exited)

func mouse_entered():
	mouse_hovering = true
	print("hover")

func mouse_exited():
	mouse_hovering = false
	print("no hover")

func _physics_process(delta):
	
	if mouse_grab:
		
		if Input.is_action_just_released("craft_grab"):
			mouse_grab = false
		
		var pos := get_viewport().get_mouse_position() - mouse_grab_offset
		get_parent().set_global_position(round(pos))		
		
	else:
		
		if Input.is_action_just_pressed("craft_grab"):
			if mouse_hovering:
				mouse_grab = true
				mouse_grab_offset = get_viewport().get_mouse_position() - grab_area.get_global_position()
		
