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
func _init(sender: String, topic: Topics) -> void:
	self.topic = topic
	self.sender = sender
	generateContent()

func generateContent():
	for n in randi_range(1, 3):
		recipients.append(DummyEmailAddr.make_email())
	greet = USER_TOPICS[Parts.GREET].pick_random()
	var body = USER_TOPICS[Parts.TOPIC][topic].pick_random()
	subject = body[Content.SUBJECT]
	content = body[Content.MESSAGE]
	signoff = USER_TOPICS[Parts.SIGNOFF].pick_random()
