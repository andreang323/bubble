extends Node

const domains = [
	"geemail.com",
	"aoll.www",
	"mariomail.net"
]
var first_names: PackedStringArray = preload("res://Data/first-names.gd").FIRST_NAMES
var last_names: PackedStringArray = preload("res://Data/last-names.gd").LAST_NAMES

func _init() -> void:
	pass

func make_email() -> String:
	return first_names[randi() % first_names.size()] + "." + last_names[randi() % last_names.size()] + "@" + domains.pick_random()
