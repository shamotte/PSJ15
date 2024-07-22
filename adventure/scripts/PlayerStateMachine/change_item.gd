extends PlayerBehaviourState

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var tool_manager := $"../../ToolManager"


func update(input : InputObject,dleta : float):
	new_velocity.emit(input.direction,0.6)
		
	
func enter(input : InputObject):
	
	animation_player.play("Take_item")
	tool_manager.change_equipd_items(input.new_item_slot)
	await animation_player.animation_finished 
	transition_state.emit("idle")
	
	
func exit():
	pass
func phisics_update(fixed_delta : float):
	pass
