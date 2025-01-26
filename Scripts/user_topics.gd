extends Node

class_name UserTopics


# TONE INDICES: 0- CASUAL, 1- SEMI-CASUAL, 2- SERIOUS
#enum Tone {CASUAL, SEMICASUAL, SERIOUS}
enum Parts {GREET, TOPIC, RESPONSES, SIGNOFF}
enum Topics {CULT, ROBOTS, DOG}
enum Content {SUBJECT, MESSAGE, ANSWER}
enum Response {VALID, UNSUBSTANTIATED, MISINFO}

const TOPIC_TO_STRING = {
	Topics.CULT: "Cult",
	Topics.ROBOTS: "Robots",
	Topics.DOG: "Dog",
}

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
				Content.ANSWER: Response.UNSUBSTANTIATED
			},
			{
				Content.SUBJECT: "Lucrative Job Opporunity",
				Content.MESSAGE: "looking 4 cult member 2 interview",
				Content.ANSWER: Response.MISINFO
			}
		],
		Topics.ROBOTS: [
			{
				Content.SUBJECT: "The Day of Reckoning Cometh",
				Content.MESSAGE: "WE'RE ALL GOING TO DIEEEEEE",
				Content.ANSWER: Response.MISINFO,
			},
			{
				Content.SUBJECT: "DOG????? T^T",
				Content.MESSAGE: "HELP THE ROBOTS ATE MY DOG",
				Content.ANSWER: Response.VALID,
			}
		],
		Topics.DOG: [
			{
				Content.SUBJECT: "Tragic News: Dog Found...",
				Content.MESSAGE: "the dog",
				Content.ANSWER: Response.UNSUBSTANTIATED,
			},
			{
				Content.SUBJECT: "DOG????? T^T",
				Content.MESSAGE: "DOG IS GONE HELP",
				Content.ANSWER: Response.VALID,
			}
		],
	},
	Parts.SIGNOFF: ["peace out", "you're's sincerely", "bye bye", "thank u"],
}
