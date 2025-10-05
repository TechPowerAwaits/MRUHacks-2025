extends Node2D

var game_manager = preload("res://scripts/GameManager.gd").new()
var element_card = preload("res://scripts/ElementCard.gd").new()

@onready var tinder = $Tinder
@onready var ui = $UI 

func _ready():
	#game_manager.combination_rejected.connect(ui._on_combination_rejected)
	game_manager.combination_accepted.connect(_on_gamemanager_combination_accepted)
	#game_manager.combination_accepted.connect(signal: StringName, callable: Callable, flags: int = 0)

func _on_tinder_accept() -> void:
	$AcceptedSFX.play()
	
	var match_element_id = element_card.element_id
	
	game_manager.process_match_attempt(match_element_id)

func _on_tinder_reject() -> void:
	$DeniedSFX.play()

func _on_tinder_elm_request() -> void:
	var elementID = game_manager.get_next_match_element_id()
	element_card.setup_card(elementID, $Tinder/Element, $Tinder/Title, $Tinder/Description)

#func _on_gamemanager_combination_accepted() -> void:
	#if ($CurrentCharacter.texture "res://Art assets/Characters/oxygen character.png"):
		#print("check")
		#$CurrentCharacter.texture = "res://Art assets/poof effect.png"
		#await get_tree().create_timer(1.0).timeout
		#$CurrentCharacter.texture = "res://Art assets/Characters/water character.png"
#
	#elif ($CurrentCharacter.texture == "res://Art assets/Characters/water character.png"):
		#$CurrentCharacter.texture = "res://Art assets/poof effect.png"
		#await get_tree().create_timer(1.0).timeout
		#$CurrentCharacter.texture = "res://Art assets/Characters/carbonate.png"
	#
	#elif ($CurrentCharacter.texture == "res://Art assets/Characters/carbonate.png"):
		#$CurrentCharacter.texture = "res://Art assets/poof effect.png"
		#await get_tree().create_timer(1.0).timeout
		#$CurrentCharacter.texture = "res://Art assets/Characters/calcium carbonate.png"
#
	#
