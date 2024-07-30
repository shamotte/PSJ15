extends Node

signal item_send(resource : Ingridient)

func add_to_table(resource : Ingridient):
	print("Add table")
	if resource.table_item != null:
		var t = resource.table_item.instantiate()
		t.position = Vector2(randf_range(-200, 200), randf_range(-200,200))
		get_tree().get_root().get_node("WorldManager").crafting.get_node("MovableObjects").add_child(t)
		item_send.emit(resource)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
