extends Node2D

@export var character : Node

@export var anim : AnimationPlayer

@export var resource_type : Ingridient
@export var destroy_object : bool

var in_interaction : bool = false
@export var single_use : bool = true
@export var comp_interactable : Node
var used : bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	if anim != null:
		anim.play("idle")

func _process(delta):
	var body_rotation : float = character.rotation
	rotation = -body_rotation
	
func gather():
	#print("gathering")
	if !used and in_interaction:
		in_interaction = true
		used = true
	
func end_gathering():
	Global.add_to_table(get_parent().type)
	if destroy_object:
		anim.play("disappear")
	else:
		in_interaction = false
		comp_interactable.queue_free()
		self.queue_free()
	
func show_tip(show : bool):
	if used: 
		$PressE.visible = false
		return
	if in_interaction:
		$PressE.visible = false
		return
	$PressE.visible = show
	
func destroy_parent():
	get_parent().queue_free()

func set_character(new_character : Node):
	character = new_character
