extends PlayerBehaviourState

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var tool_manager : ToolManager = $"../../ToolManager"
@onready var interaction_manager := $"../../CompPlayerInteraction"


func update(input : InputObject,dleta : float):
	if input.action:
		transition_state.emit(tool_manager.get_desired_animation())
	elif input.interact:
		transition_state.emit(interaction_manager.interact())
	elif input.direction == Vector2.ZERO:
		transition_state.emit("idle")
	elif input.item_slot_change:
		transition_state.emit("change_item")
	else:
		new_velocity.emit(input.direction, 1)

func enter(input):
	animation_player.play("move")

func phisics_update(fixed_delta : float):
	pass
