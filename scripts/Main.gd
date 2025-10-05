extends Node2D

var game_manager = preload("res://scripts/GameManager.gd").new()
var element_card = preload("res://scripts/ElementCard.gd").new()
const ElementCombiner_Script = preload("res://scripts/ElementScript.gd")
@onready var current_character_sprite = $CurrentCharacter 
@onready var tinder = $Tinder
@onready var ui = $UI 

func _ready():
	game_manager.combination_rejected.connect(ui._on_combination_rejected)
	game_manager.player_element_changed.connect(_on_player_element_changed)


func _on_tinder_accept() -> void:
	$AcceptedSFX.play()
	
	var match_element_id = element_card.element_id
	
	game_manager.process_match_attempt(match_element_id)

func _on_tinder_reject() -> void:
	$DeniedSFX.play()

func _on_tinder_elm_request() -> void:
	var elementID = game_manager.get_next_match_element_id()
	element_card.setup_card(elementID, $Tinder/Element, $Tinder/Title, $Tinder/Description)

func _on_player_element_changed(new_element_id: int) -> void:
	
	var new_texture_path: String = ""
	var Elements = ElementCombiner_Script.Elements
	
	match new_element_id:
		Elements.Oxygen:
			new_texture_path = "res://Art assets/Characters/Oxygen.png"
		Elements.Water:
			new_texture_path = "res://Art assets/Characters/water character.png"
		Elements.Carbonate:
			new_texture_path = "res://Art assets/Characters/carbonate.png"
		Elements.Calcium_Carbonate:
			new_texture_path = "res://Art assets/Characters/calcium carbonate.png"



	if not new_texture_path.is_empty():
		var texture = load(new_texture_path)
		if texture:
			current_character_sprite.texture = texture
