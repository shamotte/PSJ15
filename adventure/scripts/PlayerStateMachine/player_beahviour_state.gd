extends Node
class_name PlayerBehaviourState

signal transition_state(String)
signal new_velocity(Vector2)

func update(input : InputObject,dleta : float):
	pass
	
func enter(input : InputObject):
	pass
func exit():
	pass
func phisics_update(fixed_delta : float):
	pass

