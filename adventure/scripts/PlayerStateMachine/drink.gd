extends PlayerBehaviourState

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var interaction_component := $"../../CompPlayerInteraction"
@onready var player := $"../.."
@onready var tool_manager : ToolManager = $"../../ToolManager"

func update(input : InputObject,dleta : float):
		pass
	
func enter(input : InputObject):
	print("entering_drinking")
	animation_player.play("drink")
	await animation_player.animation_finished
	var potion : DrinkablePotion = tool_manager.get_potion()
	potion.drink(player)
	tool_manager.detach_potion()
	transition_state.emit("idle")
	
	
func exit():
	pass
	
	
func phisics_update(fixed_delta : float):
	pass
