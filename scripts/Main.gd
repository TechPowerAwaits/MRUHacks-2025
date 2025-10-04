extends Node2D

var game_manager = preload("res://scripts/GameManager.gd").new()

@onready var tinder = $Tinder
#@onready var game_manager = load("res://scripts/GameManager.gd")

func _ready():
	pass # Replace with function body.

func _on_tinder_accept() -> void:
	pass # Replace with function body.

func _on_tinder_reject() -> void:
	pass # Replace with function body.


func _on_tinder_elm_request() -> void:
	var elementID = game_manager.get_next_match_element_id()
	print(elementID)
