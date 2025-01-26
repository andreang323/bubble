extends Window

var subject: String
var recipients: PackedStringArray
var sender: String
var content: String
var correct: UserTopics.Response

signal correct_answer(sender : String, victims : PackedStringArray)
signal wrong_answer(sender : String)
signal closed(sender : String)
signal sent

const load0 = preload("res://Images/loading_animation/000.png")
const load1 = preload("res://Images/loading_animation/001.png")
const load2 = preload("res://Images/loading_animation/002.png")
const load3 = preload("res://Images/loading_animation/003.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Report.hide()
	position.x = randi_range(0, 20) + 3
	position.y = randi_range(0, 20) + 21
	title = subject + "—" + sender
	$"%Subject".text = subject
	$"%Recipients".text = ", ".join(recipients)
	$"%Sender".text = sender
	$"%Content".text = content


func _on_close_requested() -> void:
	if $Report.visible == false:
		closed.emit(sender)
		queue_free()


func _on_button_pressed(button: String) -> void:
	# DISABLES BUTTONS TO PREVENT SPAM CLICKS
	$"%ButtonValid".disabled = true
	$"%ButtonUnsub".disabled = true
	$"%ButtonMisinfo".disabled = true
	if button != "valid":
		$Report.show()
		$Report/Timer.start()
		await sent
	if button == "valid" and correct == UserTopics.Response.VALID or \
	button == "unsub" and correct == UserTopics.Response.UNSUBSTANTIATED or \
	button == "misinfo" and correct == UserTopics.Response.MISINFO:
		correct_answer.emit(sender, recipients)
	else:
		wrong_answer.emit(sender)


func _on_timer_timeout() -> void:
	match $Report/PanelContainer/MarginContainer/VBoxContainer/LoadingAnim.texture:
		load0:
			$Report/PanelContainer/MarginContainer/VBoxContainer/LoadingAnim.texture = load1
		load1:
			$Report/PanelContainer/MarginContainer/VBoxContainer/LoadingAnim.texture = load2
		load2:
			$Report/PanelContainer/MarginContainer/VBoxContainer/LoadingAnim.texture = load3
		load3:
			$Report/PanelContainer/MarginContainer/VBoxContainer/LoadingAnim.texture = load0
	$Report/PanelContainer/MarginContainer/VBoxContainer/ProgressBar.value += 25
	if $Report/PanelContainer/MarginContainer/VBoxContainer/ProgressBar.value >= 100:
		sent.emit()
		$Report.hide()
	else:
		$Report/Timer.start()
