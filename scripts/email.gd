class_name email

extends Control

var id = "testuser@wand.com"
var rec = ["testuser2@wand.com", "testuser3@wand.com"]
enum Topics {CULT, ROBOTS, DOG}
var topic = Topics.CULT
var subtopic = 1
var greets = "hello friend"
var content = "today i bring you news of cult."
var signoff = "thank u :D"
var tone = "casual"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func generateContent():
	subtopic = randi_range(0, 2)
	greets = "pick me from array based on tone"
	content = "pick me based on subtopic of topic"
	signoff = "pick me from array based on tone"
