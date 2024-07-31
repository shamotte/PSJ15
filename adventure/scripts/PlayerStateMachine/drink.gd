extends PlayerBehaviourState

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var interaction_component := $"../../CompPlayerInteraction"
@onready var player :=$"../.."
@onready var tool_manager : ToolManager = $"../../ToolManager"

func update(input : InputObject,dleta : float):
		new_velocity.emit(input.direction, 0.6)
	
func enter(input : InputObject):
	print("entering_drinking")
	animation_player.play("drinking")
	await animation_player.animation_finished
	var potion : DrinkablePotion = tool_manager.get_potion()
	tool_manager.detach_potion()
	potion.drink(player)
	transition_state.emit("idle")
	
	
func exit():
	pass
	
	
func phisics_update(fixed_delta : float):
	pass
