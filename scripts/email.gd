class_name email

extends "res://scripts/user_topics.gd"

var id = "testuser@wand.com"
var rec = ["testuser2@wand.com", "testuser3@wand.com"]
var topic = Topics.CULT
var sender: String
var subject: String
var greet: String
var content: String
var signoff: String

# Called when the node enters the scene tree for the first time.
func _init() -> void:
	generateContent()
	#print(greets + content + signoff)

func generateContent():
	sender = user_topics[topic][Parts.SENDER].pick_random()
	subject = user_topics[topic][Parts.SUBJECT].pick_random()
	greet = user_topics[topic][Parts.GREET].pick_random()
	content = user_topics[topic][Parts.CONTENT].pick_random()
	signoff = user_topics[topic][Parts.SIGNOFF].pick_random()
