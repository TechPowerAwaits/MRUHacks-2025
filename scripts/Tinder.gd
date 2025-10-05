extends Node2D

signal accept
signal reject
signal elm_request

const SWIPE_THRESHOLD_DEGREES: float = 15.0 
const ROTATION_FACTOR: float = 0.005        

var dragging: bool = false
var start_drag_position: Vector2 = Vector2.ZERO
var current_card_rotation: float = 0.0 
var original_position: Vector2 = Vector2.ZERO 


func _ready() -> void:
	$No.flat = true
	$Yeah.flat = true
	
	set_process_unhandled_input(true)
	
	original_position = position 
	
	rotation = 0.0 
	position = original_position 
	
	emit_signal("elm_request")


func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if event.pressed:
				dragging = true
				start_drag_position = event.position 
			else:
				if dragging:
					dragging = false
					_handle_swipe_end()
					
	elif event is InputEventMouseMotion and dragging:
		var total_displacement_x = event.position.x - start_drag_position.x
		var total_displacement_y = event.position.y - start_drag_position.y
		
		current_card_rotation = total_displacement_x * ROTATION_FACTOR
		rotation = current_card_rotation
		
		position = original_position + Vector2(total_displacement_x, total_displacement_y)


func _handle_swipe_end() -> void:
	var angle_degrees = rad_to_deg(rotation)
	
	if angle_degrees > SWIPE_THRESHOLD_DEGREES:
		emit_signal("accept")
		_animate_out_and_request_new_card()
	elif angle_degrees < -SWIPE_THRESHOLD_DEGREES:
		emit_signal("reject")
		_animate_out_and_request_new_card()
	else:
		_animate_snap_back()


func _animate_snap_back() -> void:
	var tween = create_tween()
	tween.tween_property(self, "rotation", 0.0, 0.2).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	tween.tween_property(self, "position", original_position, 0.2).set_trans(Tween.TRANS_QUART).set_ease(Tween.EASE_OUT)
	current_card_rotation = 0.0


func _animate_out_and_request_new_card() -> void:
	rotation = 0.0
	position = original_position 
	current_card_rotation = 0.0
	
	emit_signal("elm_request")


func _on_no_pressed() -> void:
	rotation = 0.0
	position = original_position 
	current_card_rotation = 0.0
	
	emit_signal("reject")
	emit_signal("elm_request")


func _on_yeah_pressed() -> void:
	rotation = 0.0
	position = original_position
	current_card_rotation = 0.0
	
	emit_signal("accept")
	emit_signal("elm_request")
