extends Node

@onready var curent_state  :ShadowKnightBehaviour= $wander as ShadowKnightBehaviour

@onready var states= {
	"wander" : $wander,
	"chase" : $chase,
	"attack" : $attack
}

# Called when the node enters the scene tree for the first time.
func _ready():
	var context := AIContext.new()
	context.starting_pos = get_parent().global_position
	context.enemy = get_parent()
	for state : ShadowKnightBehaviour in states.values():
		state.transition_state.connect(transition_state)
		state.new_velocity.connect(Callable(get_parent(),"change_velocity"))
		state.context = context
		
	curent_state.enter()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	curent_state.update(delta)
	
	
func _physics_process(delta : float):
	curent_state.phisics_update(delta)
	


func transition_state(new_state : String):
		curent_state.exit()
		if new_state in states:
			curent_state = states[new_state]
		else:
			curent_state = states["wander"]
		curent_state.enter()
