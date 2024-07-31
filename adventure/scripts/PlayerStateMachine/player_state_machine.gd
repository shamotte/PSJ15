extends Node2D


@onready var curent_state  :PlayerBehaviourState= $idle as PlayerBehaviourState
var input : InputObject
@onready var states= {
	"idle" : $idle,
	"walk" :$walk,
	"gather":$gather,
	"swing":$swing,
	"change_item":$change_item,
	"charge_throw" : $charge_throw,
	"throw": $throw,
	"drink" : $drink
}

# Called when the node enters the scene tree for the first time.
func _ready():
	for state : PlayerBehaviourState in states.values():
		state.transition_state.connect(transition_state)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	input = gather_input()
	curent_state.update(input,delta)
	
	
func _physics_process(delta : float):
	curent_state.phisics_update(delta)
	


func transition_state(new_state : String):
		curent_state.exit()
		if new_state in states:
			curent_state = states[new_state]
		else:
			curent_state = states["idle"]
		curent_state.enter(input)
	

func gather_input() -> InputObject:
	var input := InputObject.new()
	input.direction = Vector2(Input.get_axis("left", "right"),Input.get_axis("up","down"))
	input.action = Input.is_action_pressed("adventure_use_item")
	input.interact = Input.is_action_just_released("interact")
	input.fwd = global_transform.x
	
	
	if Input.is_action_pressed("one"):
		input.new_item_slot = 0
		input.item_slot_change = true
	elif  Input.is_action_pressed("two"):
		input.new_item_slot = 1
		input.item_slot_change = true
	elif  Input.is_action_pressed("three"):
		input.new_item_slot = 2
		input.item_slot_change = true
	elif  Input.is_action_pressed("four"):
		input.new_item_slot = 3
		input.item_slot_change = true
	elif  Input.is_action_pressed("five"):
		input.new_item_slot = 4
		input.item_slot_change = true
	
	
	return input
	
	
