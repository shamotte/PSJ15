extends PlayerBehaviourState

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"



func update(input : InputObject,dleta : float):
	new_velocity.emit(input.direction,0.3)
		
	
func enter(input : InputObject):
	animation_player.play("swing")
	await animation_player.animation_finished 
	transition_state.emit("idle")
	
	
func exit():
	pass
func phisics_update(fixed_delta : float):
	pass
