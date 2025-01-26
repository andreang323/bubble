extends Control

@export var infection_time = 5.0
@export var infection_variance = 3.0

var email_panel = preload("res://email_panel.tscn")
@onready var email_tree = $Window/Emails
var root: TreeItem
var topic: UserTopics.Topics
# tracks total users
var infected: Dictionary
# tracks reference to items
var infection_items: Dictionary
# tracks timers
var infection_timers: Dictionary
# tracks currently open emails
var open: Dictionary

const letter_icon = preload("res://Images/letter.png")

## takes email object and creates item in tree
func make_email_item(gotmail):
	var item = email_tree.create_item(root)
	item.set_icon(0, letter_icon)
	item.set_text(0, gotmail.subject)
	item.set_text(1, gotmail.sender)
	infection_items[gotmail.sender] = item
	_update_title()

## takes list of targets and makes timer for each target
## also populates list with reference to timers for erasing
func make_infection_timers(targets: PackedStringArray) -> void:
	for rec in targets:
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = infection_time + randf_range(-infection_variance, infection_variance)
		timer.one_shot = true
		timer.start()
		timer.timeout.connect(_on_timer_timeout.bind(rec))
		infection_timers[rec] = timer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Window.title = "Topic—" + UserTopics.TOPIC_TO_STRING[topic]
	root = email_tree.create_item()
	var start_vector = Email.new(DummyEmailAddr.make_email(), topic)
	infected[start_vector.sender] = start_vector
	make_email_item(start_vector)
	make_infection_timers(start_vector.recipients)

## create new email from recipient upon timeout
func _on_timer_timeout(rec: String) -> void:
	if rec in infection_timers:
		infection_timers[rec].stop()
		infection_timers.erase(rec)
		infected[rec] = Email.new(rec, topic)
		make_email_item(infected[rec])
		make_infection_timers(infected[rec].recipients)
	else:
		# oh god the timer wasn't removed
		print("oops")

## spawns email panel with correct information
func _on_emails_item_selected() -> void:
	var selected_sender = email_tree.get_selected().get_text(1)
	# check if panel already open
	if selected_sender not in open:
		var selected = infected[selected_sender]
		var panel = email_panel.instantiate()
		open[selected_sender] = panel
		panel.subject = selected.subject
		panel.recipients = selected.recipients
		panel.sender = selected.sender
		panel.content = "\n".join([selected.greet, selected.content, selected.signoff])
		panel.correct = selected.correct
		panel.wrong_answer.connect(_on_wrong_answer)
		panel.correct_answer.connect(_on_correct_answer)
		panel.closed.connect(_panel_closed)
		add_child(panel)
	else:
		open[selected_sender].grab_focus()

## takes sender and recipients
## removes sender from list of infected
## and stops any running timers for recipients
func _on_correct_answer(sender: String, recs: PackedStringArray) -> void:
	_panel_closed(sender)
	# check if valid sender
	if sender in infected:
		infected.erase(sender)
		infection_items[sender].free()
		infection_items.erase(sender)
		_update_title()
		for rec in recs:
			if rec in infection_timers:
				infection_timers[rec].stop()
				infection_timers.erase(rec)
	else:
		# window was NOT closed oh no
		printerr("what the heck")

## Makes item inaccessible
## makes timer for next email from same sender
## and guarantees conversion of recipients
func _on_wrong_answer(sender: String) -> void:
	$%WrongAnswer.show()
	_panel_closed(sender)
	# remove current email item
	infection_items[sender].free()
	infection_items.erase(sender)
	_update_title()
	# set timer for next email from same sender
	make_infection_timers([sender])
	# leave other timers running for guaranteed conversion

func _on_close_requested() -> void:
	visible = false

func _panel_closed(sender: String) -> void:
	# check first
	if sender in open:
		# remove panel
		var temp = open[sender]
		open.erase(sender)
		temp.queue_free()

func _update_title() -> void:
	$Window.title = "Topic—" + UserTopics.TOPIC_TO_STRING[topic] + " (" + str(len(infection_items)) + ")"
