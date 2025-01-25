extends Node

const domains = [
	"geemail.com",
	"aoll.www",
	"mariomail.net"
]
var first_names: PackedStringArray
var last_names: PackedStringArray

func _init() -> void:
	var first_file = FileAccess.open("res://Data/first-names.txt", FileAccess.READ)
	first_names = first_file.get_as_text().split("\n")
	var last_file = FileAccess.open("res://Data/last-names.txt", FileAccess.READ)
	last_names = last_file.get_as_text().split("\n")

func make_email() -> String:
	return first_names[randi() % first_names.size()] + "." + last_names[randi() % last_names.size()] + "@" + domains.pick_random()
