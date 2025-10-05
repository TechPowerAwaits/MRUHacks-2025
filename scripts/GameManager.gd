extends RefCounted


const Elements = preload("res://scripts/ElementScript.gd").Elements
const ElementCombiner_Script = preload("res://scripts/ElementScript.gd") 
const NO_COMBINATION = preload("res://scripts/ElementScript.gd").NO_COMBINATION
const Combination_Results = preload("res://scripts/ElementScript.gd").Combination_Results # <--- ADD THIS LINE

var current_element_id: Elements = Elements.Oxygen # Always start as oxygen for now! Change this later on
var target_element_id: Elements = Elements.Water   # todo make this not hardcoded lmao

signal player_element_changed(new_element_id)
# signal game_won() # or at least, the current goal has been reached
signal combination_accepted() 
signal combination_rejected(rejection_text) 

func get_next_match_element_id() -> Elements:
	var all_element_names: Array = Elements.keys()
	var index = randi() % (ElementCombiner_Script.ELEMENT_ENUM_SIZE)
	return Elements.get(all_element_names[index])
	
func process_match_attempt(match_element_id: Elements) -> void:
	var result_id = ElementCombiner_Script.combine_elements(current_element_id, match_element_id)

	if result_id != NO_COMBINATION:
		print("MATCH SUCCESS! ", Elements.keys()[current_element_id], " + ", Elements.keys()[match_element_id], " = ", Elements.keys()[result_id])
		
		current_element_id = result_id
		
		emit_signal("player_element_changed", current_element_id)
		emit_signal("combination_accepted")
		
		#if current_element_id == target_element_id:
		#	emit_signal("game_won")
		
	else:
		var id_a: int = current_element_id
		var id_b: int = match_element_id
		
		var key_parts: Array = [id_a, id_b]
		#print(id_a)
		#print(id_b)
		
		
		var combination_key: String = "%d,%d" % [key_parts[0], key_parts[1]]
		
		var rejection_text: String = "No match, " + Elements.keys()[current_element_id] + " and " + Elements.keys()[match_element_id] + " don't mix!"
		
		if Combination_Results.has(combination_key):
			rejection_text = Combination_Results[combination_key]
		key_parts.sort()
		if Combination_Results.has(combination_key):
			rejection_text = Combination_Results[combination_key]
			
		# print(rejection_text)
		emit_signal("combination_rejected", rejection_text)
