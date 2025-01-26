class_name Email

extends "res://scripts/user_topics.gd"

var topic = Topics.CULT
var recipients: PackedStringArray = PackedStringArray()
var sender: String
var subject: String
var greet: String
var content: String
var signoff: String

# Called when the node enters the scene tree for the first time.
func _init(sender: String) -> void:
	generateContent(sender)
	#print(greets + content + signoff)

func generateContent(sender: String):
	for n in randi_range(1, 3):
		recipients.append(DummyEmailAddr.make_email())
	self.sender = sender
	subject = user_topics[topic][Parts.SUBJECT].pick_random()
	greet = user_topics[topic][Parts.GREET].pick_random()
	content = user_topics[topic][Parts.CONTENT].pick_random()[Content.MESSAGE]
	signoff = user_topics[topic][Parts.SIGNOFF].pick_random()
