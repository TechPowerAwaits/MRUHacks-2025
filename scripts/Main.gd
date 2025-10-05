extends Node2D

var game_manager = preload("res://scripts/GameManager.gd").new()
var element_card = preload("res://scripts/ElementCard.gd").new()
const ElementCombiner_Script = preload("res://scripts/ElementScript.gd")
@onready var current_character_sprite = $CurrentCharacter 
@onready var tinder = $Tinder
@onready var ui = $UI 
@onready var goal_image = $UI/GoalMenu/GoalImage 
@onready var you_text = $UI/RichTextLabel

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
			$NextLevelSFX.play()
			new_texture_path = "res://Art assets/Characters/Oxygen.png"
		Elements.Water:
			$NextLevelSFX.play()
			new_texture_path = "res://Art assets/Characters/water character.png"
			goal_image.texture = load("res://Art assets/Goal2.png")
			you_text.text = "You! (Water)"
		Elements.Carbonate:
			$NextLevelSFX.play()
			new_texture_path = "res://Art assets/Characters/carbonate.png"
			you_text.text = "You! (Carbonate)"
		Elements.Calcium_Carbonate:
			$NextLevelSFX.play() #edit this tyvm
			new_texture_path = "res://Art assets/Characters/calcium carbonate.png"
			you_text.text = "You! (Calcium carbonate)"
			await get_tree().create_timer(5.0).timeout
			
			get_tree().change_scene_to_file("res://scenes/EndScreen.tscn")




	if not new_texture_path.is_empty():
		var texture = load(new_texture_path)
		if texture:
			current_character_sprite.texture = texture
