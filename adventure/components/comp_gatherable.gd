extends Node2D

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


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func gather():
	if !used:
		in_interaction = true
		used = true
	
func end_gathering():
	Global.add_to_table(get_parent().type)
	if destroy_object:
		anim.play("disappear")
	else:
		comp_interactable.queue_free()
		queue_free()
		in_interaction = false
	
func show_tip(show : bool):
	if used: 
		return
	if in_interaction:
		$PressE.visible = false
		return
	$PressE.visible = show
	
func destroy_parent():
	get_parent().queue_free()
