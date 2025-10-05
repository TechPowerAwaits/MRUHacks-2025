extends Node2D

var game_manager = preload("res://scripts/GameManager.gd").new()
var element_card = preload("res://scripts/ElementCard.gd").new()
const ElementCombiner_Script = preload("res://scripts/ElementScript.gd")
@onready var current_character_sprite = $CurrentCharacter 
@onready var tinder = $Tinder
@onready var ui = $UI 
@onready var goal_image = $UI/GoalMenu/GoalImage 
@onready var you_text = $UI/RichTextLabel

var time_start = 0
var time_now = 0

func _ready():
	game_manager.combination_rejected.connect(ui._on_combination_rejected)
	game_manager.player_element_changed.connect(_on_player_element_changed)
	time_start = Time.get_ticks_msec()
	
func _on_tinder_accept() -> void:
	Stats.global_acceptions += 1
	$AcceptedSFX.play()
	
	var match_element_id = element_card.element_id
	
	game_manager.process_match_attempt(match_element_id)

func _on_tinder_reject() -> void:
	Stats.global_rejections += 1
	$DeniedSFX.play()

func _on_tinder_elm_request() -> void:
	var elementID = game_manager.get_next_match_element_id()
	element_card.setup_card(elementID, $Tinder/Element, $Tinder/Title, $Tinder/Description)

func poof() -> void:
	var texture_temp = load("res://Art assets/poof effect.png")
	current_character_sprite.texture = texture_temp 
			
func _on_player_element_changed(new_element_id: int) -> void:
	
	var new_texture_path: String = ""
	var Elements = ElementCombiner_Script.Elements
	
	match new_element_id:   
		Elements.Oxygen:
			$NextLevelSFX.play()
			poof() 
			
			new_texture_path = "res://Art assets/Characters/Oxygen.png"
		Elements.Water:
			$NextLevelSFX.play()
			poof() 
			await get_tree().create_timer(0.5).timeout
			new_texture_path = "res://Art assets/Characters/water character.png"
			goal_image.texture = load("res://Art assets/Goal2.png")
			you_text.text = "You! (Water)"
		Elements.Carbonate:
			$NextLevelSFX.play()
			poof() 
			await get_tree().create_timer(0.5).timeout
			new_texture_path = "res://Art assets/Characters/carbonate.png"
			you_text.text = "You! (Carbonate)"
		Elements.Calcium_Carbonate:
			poof() 
			await get_tree().create_timer(0.5).timeout #edit this tyvm
			new_texture_path = "res://Art assets/Characters/calcium carbonate.png"
			you_text.text = "You! (Calcium carbonate)"
			$VictorySFX.play()
			time_now = Time.get_ticks_msec()
			Stats.global_time = round((time_now - time_start)/1000)
			Stats.global_score = 100 - min(100, Stats.global_time / 10 + Stats.global_mistakes * 5)
			
	if not new_texture_path.is_empty():
		var texture = load(new_texture_path)
		if texture:
			current_character_sprite.texture = texture

func _on_victory_sfx_finished() -> void:
	get_tree().change_scene_to_file("res://scenes/EndScreen.tscn")
