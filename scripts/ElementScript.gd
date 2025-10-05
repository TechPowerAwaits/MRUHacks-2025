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
	Plant,
	Water,
	Salt,
	Carbonate,
	Calcium_Carbonate,
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
	# Water reactions
	"31,0" : "Hydrogen is already part of water (H₂O), so it doesn't bond with water to make anything new. It’s already part of the H₂O molecule, just waiting for more water to form!",
	"31,1" : "Helium is a noble gas, meaning it doesn’t react with anything, including water. It’s just too chill to bond and prefers floating around in the air without reacting.",
	"31,2" : "Lithium reacts with water to form lithium hydroxide (LiOH) and hydrogen gas (H₂). It’s more interested in forming an alkaline solution, not just bonding to water as a simple compound.",
	"31,3" : "Beryllium reacts with water to form beryllium hydroxide (Be(OH)₂). It’s more about reacting to create an oxide and a hydroxide, not bonding with water in a simple way.",
	"31,4" : "Boron doesn't bond with water in a simple way. Boron can form boric acid (H₃BO₃) when in water, but it doesn’t directly mix with water like other elements.",
	"31,5" : "Carbon doesn’t bond with water directly. However, carbon compounds can interact with water, but elemental carbon itself remains unreactive.",
	"31,6" : "Nitrogen doesn’t bond with water. It’s a noble gas when it comes to water, meaning it won’t react and just stays in the air.",
	
	"31,8" : "Fluorine reacts with water to form hydrofluoric acid (HF) and oxygen. It’s way too reactive to simply mix with water; it breaks it down and forms new compounds instead.",
	"31,9" : "Neon is another noble gas that doesn’t interact with water. It’s too happy to stay inert, not forming any compounds or reacting with water.",
	"31,10" : "Sodium reacts with water to form sodium hydroxide (NaOH) and hydrogen gas. It’s highly reactive and forms an alkaline solution with water, not just bonding in a neutral way.",
	"31,11" : "Magnesium reacts with water to form magnesium hydroxide (Mg(OH)₂) and hydrogen gas. Magnesium forms an alkaline solution rather than simply bonding with water.",
	"31,12" : "Aluminum reacts with water, especially when heated, forming aluminum hydroxide (Al(OH)₃). It prefers to react and form a different compound rather than simply bonding with water.",
	"31,13" : "Silicon doesn’t bond with water directly. However, silicon dioxide (SiO₂) can dissolve in water under special conditions, but generally, silicon doesn’t react with water on its own.",
	"31,14" : "Phosphorus reacts with water to form phosphoric acid (H₃PO₄). Phosphorus prefers reacting to form acids, rather than bonding with water in a neutral way.",
	"31,15" : "Sulfur reacts with water to form hydrogen sulfide (H₂S) or sulfuric acid (H₂SO₄) under certain conditions. It doesn't simply bond with water; it reacts to form new compounds.",
	"31,16" : "Chlorine reacts with water to form hydrochloric acid (HCl) and hypochlorous acid (HOCl). Chlorine doesn’t just mix with water; it breaks down and reacts strongly with it.",
	"31,17" : "Argon is a noble gas, so it doesn’t react with water at all. It’s content to stay inert and doesn’t form compounds with water.",
	"31,18" : "Potassium reacts violently with water, producing potassium hydroxide (KOH) and hydrogen gas. It’s a very reactive metal and doesn’t just bond with water peacefully.",
	"31,19" : "Calcium reacts with water to form calcium hydroxide (Ca(OH)₂) and hydrogen gas. Like potassium, calcium prefers reacting with water to form compounds, not just bonding with it.",
	"31,20" : "Scandium reacts with water to form scandium hydroxide (Sc(OH)₃). It prefers reacting with water and forming a hydroxide rather than just bonding with it.",
	"31,21" : "Titanium reacts with water to form titanium hydroxide (Ti(OH)₄), not bonding directly with it in a simple way.",
	"31,22" : "Vanadium reacts with water to form vanadium hydroxide (V(OH)₅). It’s more about forming a hydroxide rather than bonding simply with water.",
	"31,23" : "Chromium reacts with water to form chromium hydroxide (Cr(OH)₃). Like other metals, it prefers to react and form a hydroxide instead of just bonding with water.",
	"31,24" : "Manganese reacts with water to form manganese hydroxide (Mn(OH)₂). It doesn't just bond with water; it forms a different compound instead.",
	"31,25" : "Iron reacts with water, especially when exposed to air, to form iron hydroxide (Fe(OH)₂). It prefers forming hydroxides instead of simple bonding with water.",
	"31,26" : "Cobalt reacts with water to form cobalt hydroxide (Co(OH)₂). It’s more into forming hydroxides than bonding simply with water.",
	"31,27" : "Nickel reacts with water to form nickel hydroxide (Ni(OH)₂). It prefers reacting with water to form compounds, rather than bonding simply.",
	"31,28" : "Copper doesn't react directly with water, but it can react with oxygen in water to form copper hydroxide (Cu(OH)₂) in the presence of air. It doesn’t just bond with water.",
	"31,29" : "Zinc reacts with water to form zinc hydroxide (Zn(OH)₂). It prefers reacting with water and forming hydroxides rather than just bonding with it.",
	# Carbonate recipies
	"33,0" : "Hydrogen reacts with carbonates to form carbonic acid (H₂CO₃), but carbonic acid is unstable and decomposes quickly into carbon dioxide (CO₂) and water (H₂O). It doesn't just create a stable compound with hydrogen alone.",
	"33,1" : "Helium is a noble gas, which means it doesn't react with carbonates or anything else. It’s happy staying inert and not forming compounds.",
	"33,2" : "Lithium reacts with carbonates to form lithium carbonate (Li₂CO₃), but this is already a carbonate itself! Lithium just keeps carbonates as they are without creating anything new or interesting here.",
	"33,3" : "Beryllium reacts with carbonates to form beryllium carbonate (BeCO₃). It doesn't bond in any unusual way with carbonates but rather forms a simple carbonate compound.",
	"33,4" : "Boron doesn’t react directly with carbonates. It prefers forming borates, so it doesn’t bond with carbonates in any noticeable way.",
	"33,5" : "Carbon can reduce carbonates when heated, causing the carbonate to break down into carbon dioxide (CO₂) and a metal oxide (like CaO from calcium carbonate), often used in industrial processes.",
	"33,6" : "Nitrogen doesn’t react with carbonates. Nitrogen tends to form nitrogen oxides (NO₂) or nitrates (NO₃⁻) but not carbonates.",
	"33,7" : "Carbonates already contain oxygen in their structure, so adding more oxygen doesn't create a new compound. Instead, it may lead to decomposition under heat, releasing carbon dioxide (CO₂) and oxygen (O₂).",
	"33,8" : "Fluorine is too reactive and typically bonds with metals or oxygen. It doesn’t mix with carbonates but will react with other elements to form fluorides.",
	"33,9" : "Neon is a noble gas, so it doesn't react with carbonates or any other compounds. It stays inert and doesn’t form any new bonds.",
	"33,10" : "Sodium reacts with carbonates to form sodium carbonate (Na₂CO₃). It just forms simple carbonates without creating anything new.",
	"33,11" : "Magnesium reacts with carbonates to form magnesium carbonate (MgCO₃). Like sodium, it just forms a simple carbonate.",
	"33,12" : "Aluminum reacts with carbonates to form aluminum carbonate (Al₂(CO₃)₃), but this reaction often requires certain conditions, and aluminum doesn't typically form carbonates easily.",
	"33,13" : "Silicon doesn’t react with carbonates under normal conditions. Silicon prefers forming silicon dioxide (SiO₂) rather than interacting with carbonates.",
	"33,14" : "Phosphorus doesn’t react with carbonates directly. It typically forms phosphates rather than carbonates.",
	"33,15" : "Sulfur doesn’t bond with carbonates. It forms sulfur oxides (SO₂) and sulfuric acid (H₂SO₄), not carbonates.",
	"33,16" : "Chlorine reacts with metals, but not carbonates in a straightforward way. It forms chlorides when it bonds with other elements, not carbonates.",
	"33,17" : "Argon is a noble gas. It doesn’t react with anything, including carbonates, so it doesn't form any compounds.",
	"33,18" : "Potassium reacts with carbonates to form potassium carbonate (K₂CO₃). Like sodium, it simply forms a basic carbonate, but nothing new or exciting happens.",
	"33,20" : "Scandium reacts with carbonates to form scandium carbonate (Sc₂(CO₃)₃), but it just forms carbonates without creating anything different or complex.",
	"33,21" : "Titanium doesn’t react with carbonates easily. It prefers forming titanium dioxide (TiO₂) rather than reacting with carbonates.",
	"33,22" : "Vanadium doesn’t bond with carbonates directly, preferring to form vanadium oxides rather than reacting with carbonates.",
	"33,23" : "Chromium reacts with carbonates to form chromium carbonate (Cr₂(CO₃)₃), but it just creates another simple carbonate, not a more complex reaction.",
	"33,24" : "Manganese reacts with carbonates to form manganese carbonate (MnCO₃), like most metals. It doesn’t make anything special when reacting with carbonates.",
	"33,25" : "Iron reacts with carbonates to form iron carbonate (FeCO₃). It doesn’t produce anything surprising and simply forms another basic carbonate.",
	"33,26" : "Cobalt reacts with carbonates to form cobalt carbonate (CoCO₃), but it just produces a simple carbonate, not anything unique.",
	"33,27" : "Nickel reacts with carbonates to form nickel carbonate (NiCO₃), continuing the trend of forming simple carbonates without any special reaction.",
	"33,28" : "Copper reacts with carbonates to form copper carbonate (CuCO₃). Like other metals, it just forms a basic carbonate without anything new.",
	"33,29" : "Zinc reacts with carbonates to form zinc carbonate (ZnCO₃), just like the other metals. It forms a basic carbonate.",
}

# All recipies lol
const RECIPES: Dictionary = {
	"0,7": Elements.Water, # 31
	"5,31" : Elements.Carbonate,
	"19,33" : Elements.Calcium_Carbonate,
}
# todo make this just use ^ for less editing
const PRIORITY_MATCHES: Dictionary = {
	Elements.Oxygen: Elements.Hydrogen, 
	Elements.Water: Elements.Carbon,   
	Elements.Carbonate: Elements.Calcium,
}
const PRIORITY_WEIGHT: int = 3

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
