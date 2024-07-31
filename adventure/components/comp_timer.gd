extends Node

@export var interaction_comp : Node
@export var change_interaction : int
@export var when_interaction : int 		#when to start timer

func _ready():
	interaction_comp.connect("next_interaction_signal",timer_on)

func timer_on():
	#print("timer on")
	if when_interaction == interaction_comp.get_interaction_index():
		$Timer.start()

func _on_timer_timeout():
	interaction_comp.set_interaction(change_interaction)
	interaction_comp.set_area(change_interaction)
	#print("Timer finished")
