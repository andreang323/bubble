extends Window

var subject: String
var recipients: PackedStringArray
var sender: String
var content: String
var correct: UserTopics.Response

signal correct_answer
signal wrong_answer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randi_range(0, 20) + 3
	position.y = randi_range(0, 20) + 21
	title = subject + "—" + sender
	$"%Subject".text = subject
	$"%Recipients".text = ", ".join(recipients)
	$"%Sender".text = sender
	$"%Content".text = content


func _on_close_requested() -> void:
	queue_free()

# LINK CORRECT BUTTON TO EMIT CORRECT SIGNAL
# AND WRONG BUTTON TO EMIT WRONG SIGNAL
# DISABLE BUTTONS AFTER CHOICE IS MADE


func _on_button_pressed(button: String) -> void:
	if button == "valid" and correct == UserTopics.Response.VALID or \
	button == "unsub" and correct == UserTopics.Response.UNSUBSTANTIATED or \
	button == "misinfo" and correct == UserTopics.Response.MISINFO:
		correct_answer.emit()
	else:
		wrong_answer.emit()
