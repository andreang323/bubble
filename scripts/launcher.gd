extends Control

var clicked = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Window.hide()
	$Hub.hide()

func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed():
		if clicked != true:
			clicked = true
			if $Timer.is_stopped():
				$Timer.start()
		else:
			$Window.show()

func _on_timer_timeout() -> void:
	clicked = false


func _on_start_pressed() -> void:
	$Window.hide()
	$Hub.show()
