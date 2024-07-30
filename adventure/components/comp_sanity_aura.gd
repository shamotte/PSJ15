extends Node2D

@export var amount_of_restored_sanity : int
var timeout : bool = false

func increase_sanity(character : Node):
	print("sanity")
	if timeout: 
		var component : Node2D = character.get_node("CompSanity")
		component.increase_sanity(amount_of_restored_sanity)
		timeout = false

func _on_timer_timeout():
	timeout = true
