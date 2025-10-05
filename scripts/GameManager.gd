extends RefCounted


const Elements = preload("res://scripts/ElementScript.gd").Elements
const ElementCombiner_Script = preload("res://scripts/ElementScript.gd") 
const NO_COMBINATION = preload("res://scripts/ElementScript.gd").NO_COMBINATION
const Combination_Results = preload("res://scripts/ElementScript.gd").Combination_Results # <--- ADD THIS LINE

var current_element_id: Elements = Elements.Oxygen # Always start as oxygen for now! Change this later on

signal player_element_changed(new_element_id)
# signal game_won() # or at least, the current goal has been reached
signal combination_accepted() 
signal combination_rejected(rejection_text) 

func get_next_match_element_id() -> Elements:
	var pool: Array = []
	for i in range(ElementCombiner_Script.ELEMENT_ENUM_SIZE):
		pool.append(Elements.values()[i])

	if ElementCombiner_Script.PRIORITY_MATCHES.has(current_element_id):
		var priority_element_id = ElementCombiner_Script.PRIORITY_MATCHES[current_element_id]
		
		for i in range(ElementCombiner_Script.PRIORITY_WEIGHT):
			pool.append(priority_element_id)

	var index = randi() % pool.size()
	return pool[index]
	
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
		
		Stats.global_mistakes += 1
		# print(rejection_text)
		emit_signal("combination_rejected", rejection_text)
