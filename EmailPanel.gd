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
	$PanelContainer/VBoxContainer/subject.text = subject
	$PanelContainer/VBoxContainer/recipients.text = ", ".join(recipients)
	$PanelContainer/VBoxContainer/sender.text = sender
	$PanelContainer/VBoxContainer/content.text = content


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_close_requested() -> void:
	queue_free()
