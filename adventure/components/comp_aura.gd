extends Area2D

@export var aura_component : String
@export var function_name : String

var parent :Node
var function : Callable

func _ready():
	parent = get_parent()
	function = Callable(parent.get_node(aura_component),function_name)
	function.bind()

func aura(effected : Node):
	function.call(effected)


# Called when the node enters the scene tree for the first time.
