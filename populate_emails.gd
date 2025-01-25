extends Tree

var email_panel = preload("res://EmailPanel.tscn")
var emails: Array[email]

const letter_icon = preload("res://Images/letter.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = create_item()
	for n in range(5):
		emails.append(email.new())
	for i in emails.size():
		var gotmail = emails[i]
		var item = create_item(root)
		item.set_metadata(0, i)
		item.set_icon(0, letter_icon)
		item.set_text(0, gotmail.subject)
		item.set_text(1, gotmail.sender)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_item_selected() -> void:
	var selected_id = get_selected().get_metadata(0)
	var selected = emails[selected_id]
	var panel = email_panel.instantiate()
	panel.subject = selected.subject
	panel.recipients = selected.recipients
	panel.sender = selected.sender
	panel.content = selected.content
	add_child(panel)
