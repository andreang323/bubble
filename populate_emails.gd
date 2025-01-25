extends Tree

var emails: Array[email]

const letter_icon = preload("res://Images/letter.png")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = create_item()
	for n in range(5):
		emails.append(email.new())
	for gotmail in emails:
		print(gotmail.subject)
		var item = create_item(root)
		item.set_icon(0, letter_icon)
		item.set_text(0, gotmail.subject)
		item.set_text(1, gotmail.sender)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_cell_selected() -> void:
	print(get_selected())
	pass # Replace with function body.
