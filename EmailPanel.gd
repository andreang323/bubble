extends Window

var subject: String
var recipients: PackedStringArray
var sender: String
var content: String
var responses: PackedStringArray

@onready var buttons = [$PanelContainer/VBoxContainer/HBoxContainer/Button,
$PanelContainer/VBoxContainer/HBoxContainer/Button2,
$PanelContainer/VBoxContainer/HBoxContainer/Button3]

#func _init(subject: String, sender: String, content: String) -> void:
#	self.subject = subject
#	self.sender = sender
#	self.content = content

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = randi_range(0, 20) + 3
	position.y = randi_range(0, 20) + 21
	title = subject + "-" + sender
	$PanelContainer/VBoxContainer/MarginContainer/Metadata/SubjectField/subject.text = subject
	$PanelContainer/VBoxContainer/MarginContainer/Metadata/RecipientsField/recipients.text = ", ".join(recipients)
	$PanelContainer/VBoxContainer/MarginContainer/Metadata/SenderField/sender.text = sender
	$PanelContainer/VBoxContainer/NinePatchRect/ScrollContainer/MarginContainer/content.text = content
	for i in range(0, len(responses)):
		buttons[i].text = responses[i]


func _on_close_requested() -> void:
	queue_free()

# LINK CORRECT BUTTON TO EMIT CORRECT SIGNAL
# AND WRONG BUTTON TO EMIT WRONG SIGNAL
# DISABLE BUTTONS AFTER CHOICE IS MADE
