# ElementCard.gd
extends RefCounted

const ElementScript = preload("res://scripts/ElementScript.gd")

var element_id: int 

func setup_card(id: int, sprite: Sprite2D, name_label: Label) -> void:
	element_id = id
	
	var element_name: String = ElementScript.Elements.keys()[id]
	name_label.text = element_name
	
	
	var texture: Texture2D = load("res://Sprites/%s.png" % element_name)
	if texture:
		sprite.texture = texture
	else:
		print("WARNING: Missing sprite for ", element_name)
		
