extends PlayerBehaviourState

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var tool_manager : ToolManager = $"../../ToolManager"
@onready var interaction_manager := $"../../CompPlayerInteraction"
func update(input : InputObject,dleta : float):
	if input.action:
		transition_state.emit(tool_manager.get_desired_animation())
	elif input.interact:
		transition_state.emit(interaction_manager.interact())
	elif input.item_slot_change:
		transition_state.emit("change_item")
	elif input.direction != Vector2.ZERO:
		transition_state.emit("walk")
	
	
func enter(input : InputObject):
	#print("entering idle")
	new_velocity.emit(Vector2.ZERO,0)
	animation_player.play("idle")
func exit():
	pass
func phisics_update(fixed_delta : float):
	pass
