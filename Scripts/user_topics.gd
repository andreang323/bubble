extends Node

class_name UserTopics


# TONE INDICES: 0- CASUAL, 1- SEMI-CASUAL, 2- SERIOUS
#enum Tone {CASUAL, SEMICASUAL, SERIOUS}
enum Parts {GREET, TOPIC, RESPONSES, SIGNOFF}
enum Topics {CULT, ROBOTS, DOG}
enum Content {SUBJECT, MESSAGE}
enum Response {VALID, UNSUBSTANTIATED, MISINFO}

# NOTES: NEED TO RESTRUCTURE GREETS AND SIGNOFF TO
# BE INDEPENDENT OF TOPIC
# RESPONSES SHOULD BE INDEPENDENT OF CONTENT
# CONTENT SHOULD BE DEPENDENT ON SUBTOPIC
# NOTE(hinchliff): Subject being part of or independent of body subject for debate

const USER_TOPICS = {
	Parts.GREET: ["hello friend", "hey everyone", "hi guys", "whassup y'all"],
	Parts.TOPIC: {
		Topics.CULT: [
			{
				Content.SUBJECT: "O_O omg cult real?!?1!?",
				Content.MESSAGE: "omg i can't believe they're real omgomg",
			},
			{
				Content.SUBJECT: "Lucrative Job Opporunity",
				Content.MESSAGE: "looking 4 cult member 2 interview",
			}
		],
		Topics.ROBOTS: [
			{
				Content.SUBJECT: "The Day of Reckoning Cometh",
				Content.MESSAGE: "WE'RE ALL GOING TO DIEEEEEE",
			},
			{
				Content.SUBJECT: "DOG????? T^T",
				Content.MESSAGE: "HELP THE ROBOTS ATE MY DOG",
			}
		],
		Topics.DOG: [
			{
				Content.SUBJECT: "Tragic News: Dog Found...",
				Content.MESSAGE: "the dog",
			},
			{
				Content.SUBJECT: "DOG????? T^T",
				Content.MESSAGE: "DOG IS GONE HELP",
			}
		],
	},
	Parts.RESPONSES: {
		Response.VALID: "valid concern",
		Response.UNSUBSTANTIATED: "unsubstantiated claim",
		Response.MISINFO: "blatant misinformation.",
	},
	Parts.SIGNOFF: ["peace out", "you're's sincerely", "bye bye", "thank u"],
}
