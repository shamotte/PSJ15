extends Control

@export var character : Node

@export var text : String = "Jakis tam tekst" 

var current_text : String = ""
var index : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$DialogTime.connect("timeout",hide_panel)
	$Timer.connect("timeout",write)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var body_rotation : float = character.rotation
	rotation = -body_rotation
	#print($Timer.get_time_left())
	#if $Timer.get_time_left()

func dialog_on():
	#$ColorRect.visible = true
	$Label.text = ""
	current_text = ""
	index = 0
	$Label.visible = true
	$DialogTime.start()
	$DialogTime.stop()
	$Timer.start()
	print("dialog start")
	
func hide_panel():
	$Label.visible = false
	$DialogTime.stop()
	print("dialog stop")
	
func write():
	if index < len(text): 
		current_text += text[index]
		$Label.text = current_text
		index += 1
	else:
		$Timer.stop()
		$DialogTime.start()

