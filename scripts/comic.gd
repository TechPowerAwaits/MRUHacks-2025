extends AnimationPlayer

static var pgNum: int = 1

func _ready() -> void:
	play("Comic")
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Skip"):
		_on_animation_finished("Comic")


func _on_animation_finished(_anim_name: StringName) -> void:
	match pgNum:
		1:
			pgNum += 1
			get_tree().change_scene_to_file("res://scenes/comic2.tscn")
		2:
			get_tree().change_scene_to_file("res://scenes/main.tscn")
