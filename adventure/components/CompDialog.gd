extends Control

@export var character : Node

@export_group("Dialog Options")
@export var writing_speed : float = 0.1
@export_multiline var text : Array[String] = ["Jakis tam tekst"] 
var text_index : int = -1

var current_text : String = ""
var index : int = 0

var in_dialog : bool = false

var number_of_interactions : int

signal dialog_start
signal dialog_end



# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = writing_speed
	$DialogTime.connect("timeout",hide_panel)
	$Timer.connect("timeout",write)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var body_rotation : float = character.rotation
	rotation = -body_rotation
	#if $Timer.get_time_left()

func dialog_on():
	emit_signal("dialog_start")
	next_text()
	in_dialog = true
	show_tip(false)
	#$ColorRect.visible = true
	$Label.text = ""
	current_text = ""
	index = 0
	$Label.visible = true
	$DialogTime.start()
	$DialogTime.stop()
	$Timer.start()
	#print("dialog start")
	
func hide_panel():
	$Label.visible = false
	$DialogTime.stop()
	in_dialog = false
	emit_signal("dialog_end")
	#print("dialog stop")
	
func write():
	if index < len(text[text_index]): 
		current_text += text[text_index][index]
		$Label.text = current_text
		index += 1
	else:
		$Timer.stop()
		$DialogTime.start()
		
func show_tip(show : bool):
	if in_dialog:
		$PressE.visible = false
		return
	$PressE.visible = show
	
func next_text():
	text_index += 1
	if text_index >= len(text):
		text_index = 0

