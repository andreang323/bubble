class_name EmailPanel

extends Window

var subject: String
var sender: String
var content: String

#func _init(subject: String, sender: String, content: String) -> void:
#	self.subject = subject
#	self.sender = sender
#	self.content = content

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print($PanelContainer/VBoxContainer/subject)
	$PanelContainer/VBoxContainer/subject.text = subject
	$PanelContainer/VBoxContainer/sender.text = sender
	$PanelContainer/VBoxContainer/content.text = content


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
