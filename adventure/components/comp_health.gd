extends Node2D

@export var max_hp : int = 10
var current_hp : int = 4

signal hp_changed(int)
signal damage_taken
signal healed
signal dead


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func deal_damage(damage : int):
	current_hp -= damage
	if current_hp <= 0:
		get_tree().change_scene_to_file("res://scenes/game_over.tscn")
		emit_signal("dead")
	if damage > 0:
		hp_changed.emit(current_hp)
		#emit_signal("hp_changed")
		emit_signal("damage_taken")
	#print("hp",current_hp)
	
func heal(heal_amount : int):
	#print("healing", heal_amount)
	current_hp += heal_amount
	if current_hp > max_hp:
		current_hp = max_hp
	if heal_amount > 0:
		hp_changed.emit(current_hp)
		#emit_signal("hp_changed")
		emit_signal("healed")
	#print("hp",current_hp)
	
func get_current_hp():
	return current_hp
	
func get_max_hp():
	return max_hp
