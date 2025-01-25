extends Tree

var emails: Array[email]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var root = create_item()
	for n in range(5):
		emails.append(email.new())
	for email in emails:
		var item = create_item(root)
		# item.set_icon(0)
		item.set_text(1, email.greets)
		item.set_text(2, "fish@fish.com")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_cell_selected() -> void:
	print(get_selected())
	pass # Replace with function body.
