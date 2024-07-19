extends Node2D

@export var sanity : int = 180
var current_sanity : int 

signal sanity_changed
signal dead

# Called when the node enters the scene tree for the first time.
func _ready():
	current_sanity = sanity

func deacrese_sanity(deacrese : int):
	current_sanity -= deacrese
	if current_sanity <= 0:
		emit_signal("dead")
	if deacrese > 0:
		emit_signal("sanity_changed")
	
func increase_sanity(increse : int):
	current_sanity += increse
	if current_sanity > sanity:
		current_sanity = sanity
	if increse > 0:
		emit_signal("sanity_changed")
	
func get_current_sanity():
	return current_sanity
	
func get_max_sanity():
	return sanity

func _on_timer_timeout():
	deacrese_sanity(1)
