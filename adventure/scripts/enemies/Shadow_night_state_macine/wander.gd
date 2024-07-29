extends  ShadowKnightBehaviour

@onready var noticing_area :Area2D = $"../../noticing_area"
@onready var animation_player : AnimationPlayer = $"../../AnimationPlayer"

var wander_position: Vector2

func update(dleta : float):
	var bodies:= noticing_area.get_overlapping_bodies()
	if len(bodies) > 0:
		context.target = bodies[0]
		transition_state.emit("chase")
		return
		
	if context.enemy.global_position.distance_to(wander_position) < 100:
		var uc :Vector2= Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
		wander_position = context.starting_pos + uc * 200
		
	
	new_velocity.emit((wander_position - context.enemy.global_position).normalized(), 0.7)
	
	
func enter():
	animation_player.play("move")
	var uc :Vector2= Vector2(randf_range(-1,1),randf_range(-1,1)).normalized()
	wander_position = context.starting_pos + uc * 200
func exit():
	pass
func phisics_update(fixed_delta : float):
	pass
