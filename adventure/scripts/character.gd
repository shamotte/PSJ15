extends CharacterBody2D


@export var tool_bar : Node
@export var chest_menu : Node
@export var base_speed : int = 100
var current_speed : int





@onready var state_machine := $PlayerStateMachine

func _ready():
	for state in state_machine.states.values():
		state.new_velocity.connect(change_velocity)
	

func _process(delta):
	if state_machine.curent_state.name != "gather":
		look_at(get_global_mouse_position())
	move_and_slide()

func change_velocity(direction : Vector2,speed_factor : float) -> void:
	velocity = direction * speed_factor * base_speed
	
func get_tool_bar():
	return tool_bar
	
func get_chest_menu():
	return chest_menu



	

	
	
