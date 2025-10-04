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
const ELEMENT_ENUM_SIZE: int = Elements.Zinc + 1 

const Descriptions: Dictionary = {
	Elements.Hydrogen: "I’m lightweight, but when we mix, we’ll explode. Let’s make some fireworks, baby.",
	Elements.Helium: "I’m all about keeping things light, but I promise, I’ll lift you higher than you’ve ever been. Let’s float away and see where the fun takes us.",
	Elements.Lithium: "I’m Lithium. I’ll keep you charged and balanced. But when the pressure’s on... oh, I’ll ignite a reaction you won’t forget.",
	Elements.Beryllium: "I’m rare, solid, and when we get close... trust me, you’ll feel the heat. Let’s make some chemistry.",
	Elements.Boron: "A little quirky, a little reactive. But if you want to get close, things are about to get HOT.",
	Elements.Carbon: "I’m the life of the party, baby. I’m all about that bond—and if we get close enough, we’ll create something legendary.",
	Elements.Nitrogen: "I’m cool, calm, and collected. But when I’m in your presence? Explosive chemistry. Let’s take it slow, or not… your call.",
	Elements.Oxygen: "I’m Oxygen—essential, and I’ll make your heart race. I’m all about that breathing life into your world... and maybe even something more if we bond long enough.",
	Elements.Fluorine: "Intense, fiery, and unforgettable. You might want to hold your breath—I’m about to set things on fire.",
	Elements.Neon: "I’m here to light up your world. When I’m around, it’s all glow and no show. Let’s keep things bright and see how long we can burn.",
	Elements.Sodium: "A little salty, but you’ll love it when we react. Get ready for a blast you won’t forget.",
	Elements.Magnesium: "Under pressure, I’m explosive. Let’s see if we can light each other up and see what happens when we spark.",
	Elements.Aluminum: "Sleek, shiny, and always ready for a good time. I’m strong, but I can still melt under the right touch.",
	Elements.Silicon: "I’m grounded, techy, and love to build things. But when I get close... we might just break all the rules.",
	Elements.Phosphorus: "I’m lit, fiery, and I don’t need much to ignite. Let’s turn the heat up and see if we can’t burn the place down.",
	Elements.Sulfur: "A little spicy, a little sultry. Let’s mix things up and see what happens when we get a little too hot to handle.",
	Elements.Chlorine: "Sharp, refreshing, and always leaving you breathless. But if you want a reaction, you’re going to have to get a little closer.",
	Elements.Argon: "Low-maintenance, but I’ll surround you when you least expect it. Let’s keep things cool—and a little mysterious.",
	Elements.Potassium: "I’m explosive, baby. Let’s see how much shock we can handle before it all blows up.",
	Elements.Calcium: "Solid, dependable, and built to last. But when you get close, I’ll strengthen everything we’ve got. Let’s build something unbreakable.",
	Elements.Scandium: "Rare, unique, and totally worth the chase. Let’s see what kind of reaction we can stir up together.",
	Elements.Titanium: "Tough, strong, and built to withstand anything. But I’m not just about strength—I can be soft too... if you know where to touch.",
	Elements.Vanadium: "A little mysterious with a sparkle. Let’s get a little creative and see what happens when we combine.",
	Elements.Chromium: "Sleek, shiny, and always polished. Let’s see what happens when we shine together—just don’t outshine me.",
	Elements.Manganese: "A little rusty, but with the right touch, I’ll be as strong as steel. Let’s make things unbreakable.",
	Elements.Iron: "Solid, reliable, and strong. Stick with me, and we’ll be the perfect match.",
	Elements.Cobalt: "Dark, bold, and unforgettable. Let’s see if we can leave a mark on each other that lasts forever.",
	Elements.Nickel: "Small but mighty. I may be underestimated, but I promise, I’ll leave a lasting impression.",
	Elements.Copper: "I’m all about making connections. Let’s see if we can get a little electric and make some sparks fly.",
	Elements.Zinc: "I’m Zinc—small but mighty. I’ll protect your heart, keep things strong, and make sure our chemistry never rusts.",
}
const Combination_Results: Dictionary = {
	"7,1" : "Helium just hangs out, doing its own thing. It’s too lazy to react with oxygen because it’s already got a full electron shell!",
	"7,2" : "Lithium is super excited and reacts with oxygen to form lithium oxide (Li₂O), a stable compound. Lithium’s always ready to bond!",
	"7,3" : "Beryllium reacts with oxygen to form beryllium oxide (BeO). It’s strong and forms a protective layer to keep the metal from rusting.",
	"7,4" : "Boron bonds with oxygen to form boron oxide (B₂O₃), a solid that’s often used in things like glass production.",
	"7,5" : "Carbon combines with oxygen to form carbon dioxide (CO₂), a gas that’s essential for plants and gives us that \"breathe-out\" feeling.",
	"7,6" : "Nitrogen and oxygen don’t normally react at room temperature, but when they’re super hot, they form nitrogen oxides (NO, NO₂), which can contribute to \"pollution.\"",
	"7,8" : "Fluorine loves to react and creates oxygen difluoride (OF₂) when mixed with oxygen. It’s highly reactive—just like fluorine!",
	"7,9" : "Neon doesn’t react with oxygen. It’s a noble gas and prefers to keep to itself, not interested in bonding with anyone.",
	"7,10" : "Sodium reacts quickly with oxygen to form sodium oxide (Na₂O). It’s very reactive, so you’d better be careful around it!",
	"7,11" : "Magnesium burns brightly in air, creating magnesium oxide (MgO), a white powder. It's used in fireproof materials!",
	"7,12" : "Aluminum forms aluminum oxide (Al₂O₃) when it reacts with oxygen, which actually protects it from rusting.",
	"7,13" : "Silicon reacts with oxygen to make silicon dioxide (SiO₂), the main ingredient in sand. So, yes, you’re walking on silicon dioxide at the beach!",
	"7,14" : "Phosphorus burns with oxygen to create phosphorus oxides (P₄O₆, P₄O₁₀). It’s super reactive, especially white phosphorus!",
	"7,15" : "Sulfur reacts with oxygen to make sulfur dioxide (SO₂), a gas that can lead to acid rain if there’s too much of it in the air.",
	"7,16" : "Chlorine and oxygen can react to make chlorine monoxide (ClO), but it’s a tricky reaction, and it’s usually not something we see much in everyday life.",
	"7,17" : "Argon doesn’t react with oxygen because it’s a noble gas. It’s content being all alone in its full electron shell.",
	"7,18" : "Potassium reacts quickly with oxygen to form potassium oxide (K₂O), which can catch fire. It’s a pretty energetic metal!",
	"7,19" : "Calcium reacts with oxygen to form calcium oxide (CaO), which is a key ingredient in cement and making concrete.",
	"7,20" : "Scandium reacts with oxygen to form scandium oxide (Sc₂O₃), a compound used in some specialized alloys.",
	"7,21" : "Titanium reacts with oxygen to form titanium dioxide (TiO₂), a compound used in paint, sunscreen, and even food coloring.",
	"7,22" : "Vanadium reacts with oxygen to form vanadium oxides (V₂O₅, VO₂), which are used in steelmaking to improve strength and resistance.",
	"7,23" : "Chromium reacts with oxygen to form chromium oxide (Cr₂O₃), which is used to make chrome plating for cars and other shiny things.",
	"7,24" : "Manganese reacts with oxygen to form manganese oxides (MnO₂, Mn₂O₃), which are used in batteries and as catalysts.",
	"7,25" : "Iron reacts with oxygen to form iron oxide (Fe₂O₃), better known as rust. It’s a slow process, but it’s always happening when iron meets air.",
	"7,26" : "Cobalt reacts with oxygen to form cobalt oxide (CoO), a black powder used in magnets and batteries.",
	"7,27" : "Nickel reacts with oxygen to form nickel oxide (NiO), a greenish compound used in rechargeable batteries.",
	"7,28" : "Copper reacts with oxygen over time, creating copper oxide (CuO), which turns green—this is what gives copper its signature patina.",
	"7,29" : "Zinc reacts with oxygen to form zinc oxide (ZnO), which is used in sunscreen to protect your skin from UV rays.",
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
