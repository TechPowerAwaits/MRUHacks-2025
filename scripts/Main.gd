extends Node2D

@onready var tinder = $Tinder
@onready var game_manager = $GameManager

func _ready():
	pass # Replace with function body.

func _on_tinder_accept() -> void:
	pass # Replace with function body.

func _on_tinder_reject() -> void:
	pass # Replace with function body.


func _on_tinder_elm_request() -> void:
	var element = game_manager.get_next_match_element_id()
