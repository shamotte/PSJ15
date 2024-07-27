extends PlayerBehaviourState

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var interaction_component := $"../../CompPlayerInteraction"
@onready var player := $"../.."
@onready var tool_manager : ToolManager = $"../../ToolManager"

func update(input : InputObject,dleta : float):
		pass
	
func enter(input : InputObject):
	animation_player.play("throw")
	await animation_player.animation_finished
	var potion : ThrowablePotion = tool_manager.get_potion()
	potion.throw(input.fwd)
	tool_manager.detach_potion()
	potion.global_position = player.global_position + input.fwd * 20
	transition_state.emit("idle")
	
	
func exit():
	pass
	
	
func phisics_update(fixed_delta : float):
	pass
