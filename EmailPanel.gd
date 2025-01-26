extends Window

var subject: String
var recipients: PackedStringArray
var sender: String
var content: String

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


func _on_close_requested() -> void:
	queue_free()
