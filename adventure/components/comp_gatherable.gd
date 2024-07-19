extends Node2D

@export var anim : AnimationPlayer

@export var resource_type : Ingridient
@export var destroy_object : bool

var in_interaction : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if anim != null:
		anim.play("idle")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func gather():
	print("gather")
	in_interaction = true
	
func end_gathering():
	print("end")
	#TODO Miejsce na dodanie zasobów
	if destroy_object:
		anim.play("disappear")
	else:
		in_interaction = false
	
func show_tip(show : bool):
	if in_interaction:
		$PressE.visible = false
		return
	$PressE.visible = show
	
func destroy_parent():
	get_parent().queue_free()