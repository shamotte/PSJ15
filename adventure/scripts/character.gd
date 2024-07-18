extends CharacterBody2D


@export var speed : int = 100
const JUMP_VELOCITY = -400.0

func _ready():
	$AnimationPlayer.play("idle")

func _physics_process(delta):
	# Add the gravity.
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var vertical := Input.get_axis("left", "right")
	var horizontal := Input.get_axis("up","down")
	
	if horizontal == 0 and vertical == 0:
		if $AnimationPlayer.current_animation != "idle":
			$AnimationPlayer.play("idle")
	else:
		if $AnimationPlayer.current_animation != "move":
			$AnimationPlayer.play("move")
	 
	velocity = Vector2(vertical,horizontal)*speed

	look_at(get_global_mouse_position())

	move_and_slide()
