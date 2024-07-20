extends CharacterBody2D


@export var Comp_interaction : Area2D

@export var speed : int = 100
var current_speed : int

var current_state : String = "normal"

const JUMP_VELOCITY = -400.0

func _ready():
	$AnimationPlayer.play("idle")
	current_speed = speed

func _physics_process(delta):

	if current_state == "gathering":
		gathering()
	else:	
		normal()

func change_state(new_state : String):
	current_state = new_state

func gathering():
	$AnimationPlayer.play("gathering")
	
func normal():
	var vertical := Input.get_axis("left", "right")
	var horizontal := Input.get_axis("up","down")
	
	if horizontal == 0 and vertical == 0:
		if $AnimationPlayer.current_animation != "idle":
			$AnimationPlayer.play("idle")
	else:
		if $AnimationPlayer.current_animation != "move":
			$AnimationPlayer.play("move")
	 
	velocity = Vector2(vertical,horizontal)*current_speed
	look_at(get_global_mouse_position())

	move_and_slide()
	
