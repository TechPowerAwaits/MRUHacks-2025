extends Node2D

func _ready() -> void:
	# To show the goal when we first launch the game so the user isn't confused.
	$GoalMenu.set_deferred("visible", true)
	$NotQuiteMenu.set_deferred("visible", false)

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Toggle Menu"):
		$PauseMenu.visible = !$PauseMenu.visible
	elif Input.is_action_just_pressed("Open Goal"):
		$GoalMenu.set_deferred("visible", !$GoalMenu.visible)

func _on_setting_button_pressed() -> void:
	get_tree().paused = true
	$PauseMenu.show()
	print("Paused")

func _on_resume_pressed() -> void:
	get_tree().paused = false
	$PauseMenu.hide()
	print("Not Paused")

func _on_exit_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func _on_goal_button_pressed() -> void:
	$GoalMenu.set_deferred("visible", true)

func _on_goal_exit_pressed() -> void:	
	$GoalMenu.set_deferred("visible", false)

func _on_combination_rejected(rejection_text: String) -> void:
	$NotQuiteMenu/TextureRect/Description.text = rejection_text
	
	$NotQuiteMenu.show()
	
