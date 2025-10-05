
extends Node2D

var game_manager = preload("res://scripts/GameManager.gd").new()
var element_card = preload("res://scripts/ElementCard.gd").new()

@onready var tinder = $Tinder

func _ready():
	pass # Replace with function body.


func _on_tinder_accept() -> void:
	$AcceptedSFX.play()
	# id, call gamemanager lol
	var match_element_id = element_card.element_id
	
	game_manager.process_match_attempt(match_element_id)

func _on_tinder_reject() -> void:
	$DeniedSFX.play()

func _on_tinder_elm_request() -> void:
	var elementID = game_manager.get_next_match_element_id()
	element_card.setup_card(elementID, $Tinder/Element, $Tinder/Title, $Tinder/Description)
