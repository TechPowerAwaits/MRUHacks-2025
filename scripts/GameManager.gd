# Overall game manager (controls all states), autoload this
extends RefCounted


const Elements = preload("res://scripts/ElementScript.gd").Elements
const ElementCombiner_Script = preload("res://scripts/ElementScript.gd") 
const NO_COMBINATION = preload("res://scripts/ElementScript.gd").NO_COMBINATION

var current_element_id: Elements = Elements.Oxygen # Always start as oxygen for now! Change this later on
var target_element_id: Elements = Elements.Water   # todo make this not hardcoded lmao

signal player_element_changed(new_element_id)
signal game_won() # or at least, the current goal has been reached

func get_next_match_element_id() -> Elements:
	var index = randi() % Elements.size()
	return Elements
	
func process_match_attempt(match_element_id: Elements) -> void:
	var result_id = ElementCombiner_Script.combine_elements(current_element_id, match_element_id)

	if result_id != NO_COMBINATION:
		print("MATCH SUCCESS! ", Elements.keys()[current_element_id], " + ", Elements.keys()[match_element_id], " = ", Elements.keys()[result_id])
		
		current_element_id = result_id
		
		emit_signal("player_element_changed", current_element_id)
		
		if current_element_id == target_element_id:
			emit_signal("game_won")
		
	else:
		print("NO MATCH! ", Elements.keys()[current_element_id], " and ", Elements.keys()[match_element_id], " don't mix.")
