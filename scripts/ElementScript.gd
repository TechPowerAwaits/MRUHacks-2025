extends RefCounted





# Enums in godotscript follow a 0 -> 1 -> 2 -> 3 default.
# Hydrogen = 0, etc..
# This is just shorthanding everything lol
enum Elements {  
	Hydrogen,
	Helium,
	Lithium,
	Beryllium,
	Boron,
	Carbon,
	Nitrogen,
	Oxygen,
	Fluorine,
	Neon,
	Sodium,
	Magnesium,
	Aluminum,
	Silicon,
	Phosphorus,
	Sulfur,
	Chlorine,
	Argon,
	Potassium,
	Calcium,
	Scandium,
	Titanium,
	Vanadium,
	Chromium,
	Manganese,
	Iron,
	Cobalt,
	Nickel,
	Copper,
	Zinc,
	# Combined elements goes here (30+...)
	Water,
	Plant
}  



# All recipies lol
const RECIPES: Dictionary = {
	"0,7": Elements.Water, # 31
}

const NO_COMBINATION: int = -1
static func combine_elements(element_a: Elements, element_b: Elements) -> Elements:
	var id_a: int = element_a
	var id_b: int = element_b
	
# whatever order works
	var key_parts: Array = [id_a, id_b]
	key_parts.sort() 
	
	var combination_key: String = "%d,%d" % [key_parts[0], key_parts[1]]
	
	if RECIPES.has(combination_key):
		return RECIPES[combination_key]
	else:
		return NO_COMBINATION


# remove this later
#func _ready():
	#var result_water = combine_elements(Elements.Hydrogen, Elements.Oxygen)
	#print("Hydrogen + Oxygen = ", Elements.keys()[result_water])

	#var result_water_reverse = combine_elements(Elements.Oxygen, Elements.Hydrogen)
	#print("Oxygen + Hydrogen = ", Elements.keys()[result_water_reverse])

	#var result_none = combine_elements(Elements.Helium, Elements.Neon)
	#if result_none == NO_COMBINATION:
	#	print("Break")
	

# Usage: var result_element = ElementScript.combine_elements(element_a, element_b)
