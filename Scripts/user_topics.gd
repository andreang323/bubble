extends Node

class_name UserTopics


# TONE INDICES: 0- CASUAL, 1- SEMI-CASUAL, 2- SERIOUS
#enum Tone {CASUAL, SEMICASUAL, SERIOUS}
enum Parts {GREET, TOPIC, RESPONSES, SIGNOFF}
enum Topics {CULT, ROBOTS, DOG}
enum Content {SUBJECT, MESSAGE, ANSWER}
enum Response {VALID, MISINFO, SCAM}

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
# AN: could make subject a key for different bodies
const USER_TOPICS = {
	Parts.GREET: ["hello friend", "hey everyone", "hi guys", "whassup y'all"],
	Parts.TOPIC: {
		Topics.CULT: [
			{
				Content.SUBJECT: "O_O omg cult real?!?1!?",
				Content.MESSAGE: "omg i can't believe they're real omgomg",
				Content.ANSWER: Response.MISINFO
			},
			{
				Content.SUBJECT: "What's up with this cult stuff",
				Content.MESSAGE: "I keep getting spammed about it? Know what's up?",
				Content.ANSWER: Response.VALID
			},
			{
				Content.SUBJECT: "Lucrative Job Opporunity",
				Content.MESSAGE: "looking 4 cult member 2 interview",
				Content.ANSWER: Response.MISINFO
			},
			{
				Content.SUBJECT: "Make INFINITE Money with This One SIMPLE Trick",
				Content.MESSAGE: "Our very legitimate pyramid-shaped organization is looking for new... business partners... to pay us money. Would you be interested in this great opportunity?",
				Content.ANSWER: Response.SCAM
			},
			{
				Content.SUBJECT: "Hot Dads in Your Area",
				Content.MESSAGE: "Click Here! http://moneysteal.er/",
				Content.ANSWER: Response.SCAM
			},
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
			},
			{
				Content.SUBJECT: "I LOVE Robots",
				Content.MESSAGE: "OMG Robots are SOOOOOO cooooool literally Miku moment",
				Content.ANSWER: Response.VALID,
			},
			{
				Content.SUBJECT: "Praise our AI Overlords!!!!",
				Content.MESSAGE: "Priase be to god-emperor and very attractive man Sam Altman and his cool robot that he made alone with no help.",
				Content.ANSWER: Response.MISINFO,
			}
		],
		Topics.DOG: [
			{
				Content.SUBJECT: "Tragic News: Dog Found...",
				Content.MESSAGE: "to be a dog",
				Content.ANSWER: Response.VALID,
			},
			{
				Content.SUBJECT: "Tragic News: Dog Found...",
				Content.MESSAGE: "it's my dog now.",
				Content.ANSWER: Response.MISINFO,
			},
			{
				Content.SUBJECT: "DOG????? T^T",
				Content.MESSAGE: "DOG IS GONE HELP",
				Content.ANSWER: Response.VALID,
			},
			{
				Content.SUBJECT: "Pay us Money and We'll Find Your Dog",
				Content.MESSAGE: "Give us money and we'll find your dog. Remember that if you don't we'll \"unfind\" it for you.",
				Content.ANSWER: Response.SCAM,
			}
		],
	},
	Parts.SIGNOFF: ["peace out", "you're's sincerely", "bye bye", "thank u"],
}
