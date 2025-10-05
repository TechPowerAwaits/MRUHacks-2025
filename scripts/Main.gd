extends Node2D

var game_manager = preload("res://scripts/GameManager.gd").new()
var element_card = preload("res://scripts/ElementCard.gd").new()

@onready var tinder = $Tinder
@onready var ui = $UI 

func _ready():
	game_manager.combination_rejected.connect(ui._on_combination_rejected)

func _on_tinder_accept() -> void:
	$AcceptedSFX.play()
	
	var match_element_id = element_card.element_id
	
	game_manager.process_match_attempt(match_element_id)

func _on_tinder_reject() -> void:
	$DeniedSFX.play()

func _on_tinder_elm_request() -> void:
	var elementID = game_manager.get_next_match_element_id()
	element_card.setup_card(elementID, $Tinder/Element, $Tinder/Title, $Tinder/Description)

func _on_gamemanger_combonation_accept() -> void:
	if ($CurrentCharacter.texture == "res://Art assets/poof effect.png"):
		$CurrentCharacter.texture = "res://Art assets/poof effect.png"
		$CurrentCharacter/Timertimer.set_deferred("wait_time", 0.25)
		$CurrentCharacter/Timertimer.set_deferred("one_shot", true)
		$CurrentCharacter.texture = "res://Art assets/Characters/water character.png"

	elif ($CurrentCharacter.texture == "res://Art assets/Characters/water character.png"):
		$CurrentCharacter.texture = "res://Art assets/poof effect.png"
		$CurrentCharacter/Timertimer.set_deferred("wait_time", 0.25)
		$CurrentCharacter/Timertimer.set_deferred("one_shot", true)
		$CurrentCharacter.texture = "res://Art assets/Characters/carbonate.png"
	
	elif ($CurrentCharacter.texture == "res://Art assets/Characters/carbonate.png"):
		$CurrentCharacter.texture = "res://Art assets/poof effect.png"
		$CurrentCharacter/Timertimer.set_deferred("wait_time", 0.25)
		$CurrentCharacter/Timertimer.set_deferred("one_shot", true)
		$CurrentCharacter.texture = "res://Art assets/Characters/calcium carbonate.png"

	
