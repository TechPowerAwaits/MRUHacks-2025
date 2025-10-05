# ElementCard.gd
extends RefCounted

const ElementScript = preload("res://scripts/ElementScript.gd")

var element_id: int 

func setup_card(id: int, sprite: Sprite2D, name_label: Label, description_label: Label) -> void:
	element_id = id
	
	var element_name: String = ElementScript.Elements.keys()[id]
	name_label.text = element_name
	
	var element_description: String = ElementScript.Descriptions[id]
	description_label.text = element_description
	var texture: Texture2D = load("res://Art assets/Characters/%s.png" % element_name)
	
	if texture == null:
		texture = load("res://Art assets/%s.png" % element_name.to_lower())
		# backup for lowercase godot shenanigans 
	if texture:
		sprite.texture = texture
	else:
		print("WARNING: Missing sprite for ", element_name)
		
