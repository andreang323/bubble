class_name Email

extends UserTopics

var topic = Topics.CULT
var recipients: PackedStringArray = PackedStringArray()
var sender: String
var subject: String
var greet: String
var content: String
var signoff: String

# Called when the node enters the scene tree for the first time.
func _init(sender: String, topic) -> void:
	self.topic = topic
	generateContent(sender)
	#print(greets + content + signoff)

func generateContent(sender: String):
	for n in randi_range(1, 3):
		recipients.append(DummyEmailAddr.make_email())
	self.sender = sender
	subject = USER_TOPICS[topic][Parts.SUBJECT].pick_random()
	greet = USER_TOPICS[topic][Parts.GREET].pick_random()
	content = USER_TOPICS[topic][Parts.CONTENT].pick_random()[Content.MESSAGE]
	signoff = USER_TOPICS[topic][Parts.SIGNOFF].pick_random()
