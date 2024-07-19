extends Node2D

@export var max_hp : int = 10
var current_hp : int 

signal hp_changed
signal damage_taken
signal healed
signal dead


# Called when the node enters the scene tree for the first time.
func _ready():
	current_hp = max_hp

func deal_damage(damage : int):
	current_hp -= damage
	if current_hp <= 0:
		emit_signal("dead")
	if damage > 0:
		emit_signal("hp_changed")
		emit_signal("damage_taken")
	
func heal(heal_amount : int):
	current_hp += heal_amount
	if current_hp > max_hp:
		current_hp = max_hp
	if heal_amount > 0:
		emit_signal("hp_changed")
		emit_signal("healed")
	
func get_current_hp():
	return current_hp
	
func get_max_hp():
	return max_hp
