extends Tree

@export var texture: Texture2D

const EmailGenerator = preload("res://scripts/email.gd")

var egen = EmailGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EmailGenerator.new()
	var child = create_item()
	child.set_text(0, "cult1")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_cell_selected() -> void:
	print(get_selected())
	pass # Replace with function body.
