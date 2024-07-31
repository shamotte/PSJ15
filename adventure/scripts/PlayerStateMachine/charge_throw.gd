extends PlayerBehaviourState

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var interaction_component := $"../../CompPlayerInteraction"
@onready var player := $"../.."
@onready var tool_manager : ToolManager = $"../../ToolManager"
var potion : ThrowablePotion

var charge_time := 0.0
func update(input : InputObject,delta : float):
	new_velocity.emit(input.direction, 0.7)
	charge_time += delta
	if not input.action:
		transition_state.emit("throw")
		
	
func enter(input : InputObject):
	charge_time =0
	new_velocity.emit(Vector2.ZERO,0)
	animation_player.play("charge_throw")
	potion = tool_manager.get_potion()
	
	
func exit():
	#print(charge_time)
	potion.charge_time = charge_time
	
	
func phisics_update(fixed_delta : float):
	pass
