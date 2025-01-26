extends Window

@export var infection_time = 5.0
@export var infection_variance = 3.0

var email_panel = preload("res://email_panel.tscn")
@onready var email_tree = $Emails
var root: TreeItem
var topic: UserTopics.Topics
var infected: Dictionary
var infection_items: Dictionary
var infection_timers: Dictionary

const letter_icon = preload("res://Images/letter.png")

func make_email_item(gotmail):
	var item = email_tree.create_item(root)
	item.set_icon(0, letter_icon)
	item.set_text(0, gotmail.subject)
	item.set_text(1, gotmail.sender)
	infection_items[gotmail.sender] = item

func make_infection_timers(targets: PackedStringArray) -> void:
	for rec in targets:
		var timer = Timer.new()
		add_child(timer)
		timer.wait_time = infection_time + randf_range(-infection_variance, infection_variance)
		timer.one_shot = true
		timer.start()
		timer.timeout.connect(_on_timer_timeout.bind(rec))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	title = "Topic—" + UserTopics.TOPIC_TO_STRING[topic]
	root = email_tree.create_item()
	var start_vector = Email.new(DummyEmailAddr.make_email(), topic)
	infected[start_vector.sender] = start_vector
	make_email_item(start_vector)
	make_infection_timers(start_vector.recipients)

func _on_timer_timeout(rec: String) -> void:
	infection_timers[rec].stop()
	infection_timers.erase(rec)
	infected[rec] = Email.new(rec, topic)
	make_email_item(infected[rec])
	make_infection_timers(infected[rec].recipients)

func _on_emails_item_selected() -> void:
	var selected_sender = email_tree.get_selected().get_text(1)
	var selected = infected[selected_sender]
	var panel = email_panel.instantiate()
	panel.subject = selected.subject
	panel.recipients = selected.recipients
	panel.sender = selected.sender
	panel.content = selected.content
	panel.correct_answer.connect()
	add_child(panel)
	# LINK CHILD SIGNALS TO CORRECT RESPONSE (remove item)
	# AND WRONG RESPONSE (_on_timer_timeout(rec))

func _on_correct_answer(sender: String) -> void:
	infected.erase(sender)
	infection_timers[sender].stop()
	infection_timers.erase(sender)
	infection_items[sender].queue_free()
	infection_items.erase(sender)

func _on_close_requested() -> void:
	visible = false
