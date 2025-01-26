extends Node

class_name UserTopics

enum Topics {CULT, ROBOTS, DOG}
# TONE INDICES: 0- CASUAL, 1- SEMI-CASUAL, 2- SERIOUS
#enum Tone {CASUAL, SEMICASUAL, SERIOUS}
enum Parts {SENDER, SUBJECT, GREET, CONTENT, SIGNOFF}
enum Content {MESSAGE, RESPONSES}
enum Responses {GOOD, BAD}

# NOTES: NEED TO RESTRUCTURE GREETS AND SIGNOFF TO
# BE INDEPENDENT OF TOPIC
# RESPONSES SHOULD BE INDEPENDENT OF CONTENT
# CONTENT SHOULD BE DEPENDENT ON SUBTOPIC

const USER_TOPICS = {
	Topics.CULT: {
		Parts.SENDER: ["john@notacult.net", "joe@societyforfreedom.co.us"],
		Parts.SUBJECT: ["Normal Organization Recruiting", "Free Pizza for Cult Members"],
		Parts.GREET: ["hello friend", "hey everyone", "hi guys", "whassup y'all"],
		Parts.CONTENT: [
			{
				Content.MESSAGE: "omg i can't believe they're real omgomg",
				Content.RESPONSES: {
					Responses.GOOD: ["they're not"],
					Responses.BAD: ["yeah!"],
				}
			},
			{
				Content.MESSAGE: "looking 4 cult member 2 interview",
				Content.RESPONSES: {
					Responses.GOOD: ["that would not be in your best interest"],
					Responses.BAD: ["you can interview me!"],
				}
			}
		],
		Parts.SIGNOFF: ["peace out", "you're's sincerely", "bye bye", "thank u"],
	},
	Topics.ROBOTS: {
		Parts.SENDER: ["botbot@human.net", "realboy@lifeis.io"],
		Parts.SUBJECT: ["REPOST THIS TO LIVE", "news about gen ai", "Breaking News: Robots Taking Over World"],
		Parts.GREET: ["hello friend", "hey everyone", "hi guys", "whassup y'all"],
		Parts.CONTENT: [
			{
				Content.MESSAGE: "WE'RE ALL GOING TO DIEEEEEE",
				Content.RESPONSES: {
					Responses.GOOD: ["no"],
					Responses.BAD: ["yeah!"],
				}
			},
			{
				Content.MESSAGE: "HELP THE ROBOTS ATE MY DOG",
				Content.RESPONSES: {
					Responses.GOOD: ["Please report this to the police."],
					Responses.BAD: ["oh no not the dog"],
				}
			}
		],
		Parts.SIGNOFF: ["peace out", "you're's sincerely", "bye bye", "thank u"],
	},
	Topics.DOG: {
		Parts.SENDER: ["bark@woof.grr", "mansbestfriend@doggo.gg"],
		Parts.SUBJECT: ["About that dog...", "can't believe this dog", "Tragic News: Dog Found..."],
		Parts.GREET: ["hello friend", "hey everyone", "hi guys", "whassup y'all"],
		Parts.CONTENT: [
			{
				Content.MESSAGE: "the dog",
				Content.RESPONSES: {
					Responses.GOOD: ["is fine."],
					Responses.BAD: ["oh..."],
				}
			},
			{
				Content.MESSAGE: "DOG IS GONE HELP",
				Content.RESPONSES: {
					Responses.GOOD: ["Please report this to the police."],
					Responses.BAD: ["oh no not the dog"],
				}
			}
		],
		Parts.SIGNOFF: ["peace out", "you're's sincerely", "bye bye", "thank u"],
	}
}
