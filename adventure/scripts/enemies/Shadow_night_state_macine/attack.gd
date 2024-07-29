extends  ShadowKnightBehaviour


@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
func update(dleta : float):
	pass
	
func enter():
	animation_player.play("attack")
	if not animation_player.animation_finished.is_connected(animation_finished):
		animation_player.animation_finished.connect(animation_finished)
	
func animation_finished(name : String):
	transition_state.emit("chase")	
func exit():
	pass
func phisics_update(fixed_delta : float):
	pass
