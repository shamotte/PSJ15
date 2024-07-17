extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0



func _physics_process(delta):
	# Add the gravity.
	

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var vertical := Input.get_axis("ui_left", "ui_right")
	var horizontal := Input.get_axis("ui_up","ui_down")
	velocity = Vector2(vertical,horizontal)*50

	look_at(get_global_mouse_position())

	move_and_slide()
