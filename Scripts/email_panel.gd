extends Window

var subject: String
var recipients: PackedStringArray
var sender: String
var content: String
var correct: UserTopics.Response

signal correct_answer(sender : String, victims : PackedStringArray)
signal wrong_answer(sender : String)
signal closed(sender : String)

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
	closed.emit(sender)
	queue_free() #unless waiting


func _on_button_pressed(button: String) -> void:
	# DISABLES BUTTONS TO PREVENT SPAM CLICKS
	$"%ButtonValid".disabled = true
	$"%ButtonUnsub".disabled = true
	$"%ButtonMisinfo".disabled = true
	# await if choice not "valid" for sending
	# info animation
	# CHECK ANSWER
	if button == "valid" and correct == UserTopics.Response.VALID or \
	button == "unsub" and correct == UserTopics.Response.UNSUBSTANTIATED or \
	button == "misinfo" and correct == UserTopics.Response.MISINFO:
		correct_answer.emit(sender, recipients)
	else:
		wrong_answer.emit(sender)
