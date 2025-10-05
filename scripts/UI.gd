extends Node2D

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
	$GoalMenu.visible(true)
	
func _on_goal_exit_pressed() -> void:
	$GoalMenu.visible(false)
