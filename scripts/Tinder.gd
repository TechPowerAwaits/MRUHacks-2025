extends Node2D

signal accept
signal reject

func _ready() -> void:
	$No.flat = true
	$Yeah.flat = true


func _on_no_pressed() -> void:
	emit_signal("reject")


func _on_yeah_pressed() -> void:
	emit_signal("accept")
