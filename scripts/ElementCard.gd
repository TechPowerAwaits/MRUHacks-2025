# ElementCard.gd
extends Control

const ElementScript = preload("res://scripts/ElementScript.gd")

@onready var sprite: TextureRect = $Sprite
@onready var name_label: Label = $NameLabel

var element_id: int 

func setup_card(id: int) -> void:
	element_id = id
	
	var element_name: String = ElementScript.Elements.keys()[id]
	name_label.text = element_name
	
	var texture: Texture2D = load("res://Sprites/%s.png" % element_name)
	if texture:
		sprite.texture = texture
	else:
		print("WARNING: Missing sprite for ", element_name)
