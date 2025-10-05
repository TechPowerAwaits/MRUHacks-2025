extends Node2D


func _on_restart_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")

func _on_exit_pressed() -> void:
	get_tree().quit()
	
func _ready() -> void:
	$Score.text = "Score: " + str(Stats.global_score)
	$Mistakes.text = "Mistakes: " + str(Stats.global_mistakes)
	$Rejections.text = "Rejections: " + str(Stats.global_rejections)
	$Acceptions.text = "Matches: " + str(Stats.global_acceptions)
	$Time.text = "Time: " + str(Stats.global_time) + "s"
