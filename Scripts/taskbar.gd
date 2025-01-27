extends PanelContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HBoxContainer/Label.text = _reformat_time()


func _on_timer_timeout() -> void:
	$HBoxContainer/Label.text = _reformat_time()

func _on_launcher_topicstart() -> void:
	$HBoxContainer/DogButton.show()
	$HBoxContainer/RobotButton.show()
	$HBoxContainer/CultButton.show()

func _on_launcher_appclose() -> void:
	$HBoxContainer/HubButton.hide()

func _on_launcher_appopen() -> void:
	$HBoxContainer/HubButton.show()

func _on_button_pressed() -> void:
	get_tree().quit()

func _reformat_time() -> String:
	var time = Time.get_time_string_from_system()
	var measures = time.split(":")
	var daytime = "AM"
	if int(measures[0]) > 12:
		daytime = "PM"
		measures[0] = str(int(measures[0]) % 12)
	return measures[0] + ":" + measures[1] + " " + daytime
