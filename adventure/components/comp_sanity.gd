extends Node2D

@export_group("Sanity")
@export var sanity : float = 180
@export_group("Range of view")
@export var low_sight: bool
@export var light : Node
@export var min_energy : float
@export var max_energy : float
var current_sanity : float 

signal sanity_changed
signal dead

# Called when the node enters the scene tree for the first time.
func _ready():
	current_sanity = sanity

func deacrese_sanity(deacrese : int):
	current_sanity -= deacrese
	if current_sanity <= 0:
		current_sanity = 0 
		emit_signal("dead")
	if deacrese > 0:
		emit_signal("sanity_changed")
	change_visiblity()
	
func increase_sanity(increse : int):
	current_sanity += increse
	if current_sanity > sanity:
		current_sanity = sanity
	if increse > 0:
		emit_signal("sanity_changed")
	change_visiblity()
	
func get_current_sanity():
	return current_sanity
	
func get_max_sanity():
	return sanity

func _on_timer_timeout():
	deacrese_sanity(1)
	
func get_light_energy():
	#print((sanity/max_sanity)*1024)
	#print(current_sanity," / ",sanity," = ",float(sanity/max_sanity))
	return clamp(current_sanity/sanity,min_energy,max_energy)
	#return clamp(sanity/max_sanity*1024,128,1024)
	
func change_visiblity():
	light.energy = get_light_energy()
	light.scale.x =  get_light_energy()
	light.scale.y =  get_light_energy()
	#light.range_z_min = -get_light_energy()
	#light.range_z_max = get_light_energy()
