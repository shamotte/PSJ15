extends  ShadowKnightBehaviour


@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"
@onready var attack_area :Area2D= $"../../attack_area"

func update(dleta : float):
	if context.target == null:
		transition_state.emit("wander")
		return
	elif context.target.global_position.distance_to(context.enemy.global_position) > 300:
		transition_state.emit("wander")
		return
	elif len(attack_area.get_overlapping_bodies()):
		transition_state.emit("attack")
		return
	new_velocity.emit((context.target.global_position - context.enemy.global_position).normalized(), 1)
	
func enter():
	animation_player.play("move")
func exit():
	pass
func phisics_update(fixed_delta : float):
	pass
