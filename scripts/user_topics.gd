extends Node

enum Topics {CULT, ROBOTS, DOG}
# TONE INDICES: 0- CASUAL, 1- SEMI-CASUAL, 2- SERIOUS
#enum Tone {CASUAL, SEMICASUAL, SERIOUS}
enum Parts {SENDER, SUBJECT, GREET, CONTENT, SIGNOFF}

const user_topics = {
	Topics.CULT: {
		Parts.SENDER: ["john@notacult.net", "joe@societyforfreedom.co.us"],
		Parts.SUBJECT: ["Normal Organization Recruiting", "Free Pizza for Cult Members"],
		Parts.GREET: ["hello friend", "hey everyone", "hi guys", "whassup y'all"],
		Parts.CONTENT: ["omg i can't believe they're real omgomg", "looking 4 cult member 2 interview"],
		Parts.SIGNOFF: ["peace out", "you're's sincerely", "bye bye", "thank u"],
	}
}
