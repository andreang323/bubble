extends Window

var subject: String
var recipients: PackedStringArray
var sender: String
var content: String
var responses: PackedStringArray

@onready var buttons = [$"%ButtonValid", $"%ButtonUnsub", $"%ButtonMisinfo"]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randi_range(0, 20) + 3
	position.y = randi_range(0, 20) + 21
	title = subject + "—" + sender
	$"%Subject".text = subject
	$"%Recipients".text = ", ".join(recipients)
	$"%Sender".text = sender
	$"%Content".text = content
	for i in range(0, len(responses)):
		buttons[i].text = responses[i]


func _on_close_requested() -> void:
	queue_free()

# LINK CORRECT BUTTON TO EMIT CORRECT SIGNAL
# AND WRONG BUTTON TO EMIT WRONG SIGNAL
# DISABLE BUTTONS AFTER CHOICE IS MADE
