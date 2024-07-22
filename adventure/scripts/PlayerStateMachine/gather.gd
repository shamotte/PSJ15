extends PlayerBehaviourState

@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var interaction_component := $"../../CompPlayerInteraction"
@onready var player := $"../.."

func update(input : InputObject,dleta : float):
	pass
		
	
func enter(input : InputObject):
	new_velocity.emit(Vector2.ZERO,0)
	animation_player.play("gathering")
	player.look_at(interaction_component.Interacted_component.global_position)
	await animation_player.animation_finished 
	transition_state.emit("idle")
	
	
func exit():
	pass
func phisics_update(fixed_delta : float):
	pass
