class_name email

extends "res://scripts/user_topics.gd"

var id = "testuser@wand.com"
var rec = ["testuser2@wand.com", "testuser3@wand.com"]
var topic = Topics.CULT
var subtopic = 0
var greets = "hello friend"
var content = "today i bring you news of cult."
var signoff = "thank u :D"
var tone = Tone.CASUAL

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	generateContent()
	print(greets + content + signoff)

func generateContent():
	subtopic = randi_range(0, 0)
	greets = toneFlavor[tone][Flavor.GREET]
	content = topics[topic][subtopic][tone]
	signoff = toneFlavor[tone][Flavor.SIGNOFF]
