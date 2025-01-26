extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Window.hide()
	$Hub.hide()

func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.is_double_click():
		$Window.show()


func _on_start_pressed() -> void:
	$Window.hide()
	$Hub.show()
	# add topics


func _on_dog_bubble_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.is_double_click():
		pass
		# open topic


func _on_cult_bubble_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.is_double_click():
		pass
		# open topic


func _on_robot_bubble_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.is_double_click():
		pass
		# open topic
