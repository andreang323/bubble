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
	Parts.GREET: ["hello friend", "hey everyone", "hi guys", "whassup y'all", "Hello," , "Today I'm here to tell you about this great thing I found.", "Hello user.", "Hi."],
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
				Content.SUBJECT: "Lucrative Job Opporunity",
				Content.MESSAGE: "Looking for participants for a survey on opinions on recent cult activity.",
				Content.ANSWER: Response.VALID
			},
			{
				Content.SUBJECT: "Make INFINITE Money with This One SIMPLE Trick",
				Content.MESSAGE: "Our very legitimate pyramid-shaped organization is looking for new... business partners... to pay us money. Would you be interested in this great opportunity?",
				Content.ANSWER: Response.SCAM
			},
			{
				Content.SUBJECT: "Hot Cult Dads in Your Area",
				Content.MESSAGE: "Click Here! http://moneysteal.er/",
				Content.ANSWER: Response.SCAM
			},
			{
				Content.SUBJECT: "A New Path Forward",
				Content.MESSAGE: "Do you ever feel lost? Lonely? Without purpose in an uncaring world? Allow us to provide purpose for you, with THE CULT!",
				Content.ANSWER: Response.SCAM
			},
			{
				Content.SUBJECT: "CULT RECRUITMENT",
				Content.MESSAGE: "Joining a cult is great for your mental health> Feeling like you're part of something much grater is help your feelings> please join at www.helpyourselfjoinacult.gg",
				Content.ANSWER: Response.SCAM
			},
			{
				Content.SUBJECT: "Your Parents are in a Cult.",
				Content.MESSAGE: "I am here today to tell you that your parents are in a cult. In order to free them, you must give me 500 dollars to pay off the evil cult leaders and free them. Please email me back for payment options.",
				Content.ANSWER: Response.SCAM
			},
			{
				Content.SUBJECT: "Cult Activity Near You",
				Content.MESSAGE: "Have you ever wanted to be part of a cult? Well, I'm here to tell you that you can. Just sign up here at www.cultactivityhere.co and we'll get you in a snazzy new cultist robe today! (additional costs not covered)",
				Content.ANSWER: Response.SCAM
			},
			{
				Content.SUBJECT: "Cult Activity Near You",
				Content.MESSAGE: "Recent cult activity has been detected in your local area. For more information, check the online cult-tracker at www.culttracker.gov.",
				Content.ANSWER: Response.VALID
			},
			{
				Content.SUBJECT: "Cults are evil.",
				Content.MESSAGE: "a cult member crashed their car into my mom while she was crossing the street because they were too busy chanting. save a life. quit the cult.",
				Content.ANSWER: Response.VALID
			},
			{
				Content.SUBJECT: "Cults are evil.",
				Content.MESSAGE: "That's what they want us to believe. Society has scorned us. We must take control. They're persecuting us because they're afraid. That's okay. We must strike fear into the sheep.",
				Content.ANSWER: Response.MISINFO
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
			},
			{
				Content.SUBJECT: "Literarlly Terminator is Now",
				Content.MESSAGE: "Remember that one show that is like Miku Terminator it's like that",
				Content.ANSWER: Response.MISINFO,
			},
			{
				Content.SUBJECT: "DEAL on Robot Insurance",
				Content.MESSAGE: "Are you feeling at threat from robots? We have just the plan for you! In only 100 payments of the low price of $15 we can make you super secure!",
				Content.ANSWER: Response.VALID,
			},
			},
			{
				Content.SUBJECT: "BREAKING NEWS: ROBOTS TAKE OVER LAS VEGAS",
				Content.MESSAGE: "In a stunning turn of events, the robots recently brought to Las Vegas for a conference have spontaneously declared sovereignty over the city. Attendees of the conference have reported feeling unnerved and uncomfortable, knowing that these robots hold supreme power over them. We must take back control from these robots and reclaim LAS VEGAS!!!!!!!",
				Content.ANSWER: Response.MISINFO,
			},
			{
				Content.SUBJECT: "BREAKING NEWS: ROBOTS TAKE OVER LAS VEGAS",
				Content.MESSAGE: "A performance art piece featuring robots is currently being displayed in Las Vegas, featuring robots in different poses, ranging from imitations of iconic poses to thought-provoking postures never before seen in life. This is due to the hard work of a local artist, who's dedicated their life to capturing the interactions between robots and humans through their pieces. The event will run from January 20th through February 15th.",
				Content.ANSWER: Response.VALID,
			},
			{
				Content.SUBJECT: "I LOVE Robots",
				Content.MESSAGE: "quick repost this so they don't get rid of you when they take over the world",
				Content.ANSWER: Response.MISINFO,
			},
			{
				Content.SUBJECT: "Please Donate to Prevent Robot Overlords",
				Content.MESSAGE: "Donate to me so I can stop the robot apocalypse at www.norobotsallowed.de",
				Content.ANSWER: Response.SCAM,
			},
			{
				Content.SUBJECT: "BEEP BOOP i am robot",
				Content.MESSAGE: "i will take over your computer beep boop
				my friends will take over your world",
				Content.ANSWER: Response.MISINFO,
			},
			{
				Content.SUBJECT: "GUARANTEED ROBOT COSTUME TO WARD OFF ROBOTS",
				Content.MESSAGE: "OUr onLINe shoPPP OffeeRS a HYPERREALISTIC ROBOT COSTUME TO WARD OFF ROBOTS (for a PRice OF $99.99!!!!) buy now at www.botcostum3s.com",
				Content.ANSWER: Response.SCAM,
			},
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
			},
			{
				Content.SUBJECT: "Medidations on doggism",
				Content.MESSAGE: "What even is a dog anyway.",
				Content.ANSWER: Response.MISINFO,
			},
			{
				Content.SUBJECT: "Bark",
				Content.MESSAGE: "Bark bark. Bark bark bark. Bark.",
				Content.ANSWER: Response.VALID,
			},
			{
				Content.SUBJECT: "Check Out This Cute Cat!",
				Content.MESSAGE: "Syke it's actually a dog LMAO",
				Content.ANSWER: Response.MISINFO,
			},
			},
			{
				Content.SUBJECT: "Pay us Money and We'll Find Your Dog",
				Content.MESSAGE: "We're professional dog finders. If you ever need a dog found, email us.",
				Content.ANSWER: Response.VALID,
			},
			{
				Content.SUBJECT: "That dog.",
				Content.MESSAGE: "Have you heard about that dog? No? Well, a documentary is available at www.mockumentaryofthatdog.com. Free trial available.",
				Content.ANSWER: Response.SCAM,
			},
			{
				Content.SUBJECT: "That dog.",
				Content.MESSAGE: "If you haven't heard about that dog, it's fine. That dog hasn't heard of you.",
				Content.ANSWER: Response.VALID,
			},
			{
				Content.SUBJECT: "DOG UPDATE",
				Content.MESSAGE: "OMG THAT DOG SO CUTEEEEEEEEEEEEE",
				Content.ANSWER: Response.VALID,
			},
			{
				Content.SUBJECT: "DOG UPDATE",
				Content.MESSAGE: "At www.dogupdate.com you can receive all the updates on THAT DOG for the low price of $9.99 per month or $100 annually.",
				Content.ANSWER: Response.SCAM,
			},
			{
				Content.SUBJECT: "DOGGONE",
				Content.MESSAGE: "that dog too good",
				Content.ANSWER: Response.VALID,
			},
		],
	},
	Parts.SIGNOFF: ["peace out", "you're's sincerely", "bye bye", "thank u", "Thank you for listening.", "Your input is appreciated.", "Let me know what you think!"],
}
