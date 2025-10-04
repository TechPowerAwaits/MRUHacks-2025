extends Node2D

signal accept
signal reject
signal elm_request

func _ready() -> void:
	$No.flat = true
	$Yeah.flat = true
	emit_signal("elm_request")


func _on_no_pressed() -> void:
	emit_signal("reject")
	emit_signal("elm_request")


func _on_yeah_pressed() -> void:
	emit_signal("accept")
	emit_signal("elm_request")
