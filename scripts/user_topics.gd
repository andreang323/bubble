extends Node

enum Topics {CULT, ROBOTS, DOG}
enum Tone {CASUAL, SEMICASUAL, SERIOUS}
enum Flavor {GREET, SIGNOFF}
# TONE INDICES: 0- CASUAL, 1- SEMI-CASUAL, 2- SERIOUS
var topics = {Topics.CULT : cultTopics}
var cultTopics = [cultExist]
var cultExist = {Tone.CASUAL : cultExistCasual}

var toneFlavor = {Tone.CASUAL : {Flavor.GREET : casualGreets, Flavor.SIGNOFF : casualSignoffs}}
var cultExistCasual = ["omg i can't believe they're real omgomg", "looking 4 cult member 2 interview"]
var casualGreets = ["hello friend", "hey everyone", "hi guys", "whassup y'all"]
var casualSignoffs = ["peace out", "you're's sincerely", "bye bye", "thank u"]
