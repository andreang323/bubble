extends Control

var DogTopic = preload("res://topic.tscn")
var RobotTopic = preload("res://topic.tscn")
var CultTopic = preload("res://topic.tscn")

var started = false

var dogtop
var robtop
var cultop

signal appopen
signal appclose
signal topicstart

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Window.hide()
	$Hub.hide()

func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.is_double_click():
		appopen.emit()
		if !started:
			$Window.show()
		else:
			$Hub.show()


func _on_start_pressed() -> void:
	started = true
	$Window.hide()
	$Hub.show()
	dogtop = DogTopic.instantiate()
	dogtop.topic = UserTopics.Topics.DOG
	dogtop.visible = false
	dogtop.infection_time = 60
	dogtop.infection_variance = 5
	robtop = RobotTopic.instantiate()
	robtop.topic = UserTopics.Topics.ROBOTS
	robtop.visible = false
	robtop.infection_time = 40
	robtop.infection_variance = 2
	cultop = CultTopic.instantiate()
	cultop.topic = UserTopics.Topics.CULT
	cultop.visible = false
	cultop.infection_time = 30
	cultop.infection_variance = 3
	_on_refresh_timer_timeout()
	add_child(dogtop)
	add_child(robtop)
	add_child(cultop)
	topicstart.emit()


func _on_dog_bubble_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.is_double_click():
		dogtop.show()
		dogtop.get_child(0).grab_focus()


func _on_cult_bubble_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.is_double_click():
		cultop.show()
		cultop.get_child(0).grab_focus()


func _on_robot_bubble_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.is_double_click():
		robtop.show()
		robtop.get_child(0).grab_focus()


# GET TOPIC CURRENT SIZE, RESIZE BUBBLES
func _update_bubbles():
	var dogsize = len(dogtop.infected) * 5
	var robsize = len(robtop.infected) * 5
	# i needed a 7 letter word ok
	var calzone = len(cultop.infected) * 5
	$Hub/TextureRect/VBoxContainer/HBoxContainer/Dog/DogBubble.custom_minimum_size = Vector2(dogsize, dogsize)
	$Hub/TextureRect/VBoxContainer/HBoxContainer/Robots/RobotBubble.custom_minimum_size = Vector2(robsize, robsize)
	$Hub/TextureRect/VBoxContainer/HBoxContainer/Cult/CultBubble.custom_minimum_size = Vector2(calzone, calzone)
	if (len(dogtop.infected) + len(robtop.infected) + len(cultop.infected))> 100:
		print('gameover')
		# put BSOD or something
		get_tree().paused = true
		get_tree().change_scene_to_file("res://bsod.tscn")

func _on_refresh_timer_timeout() -> void:
	_update_bubbles()
	$Hub/RefreshTimer.start()


func _on_hub_close_requested() -> void:
	$Hub.hide()


func _on_window_close_requested() -> void:
	$Window.hide()
	appclose.emit()


func _on_quit_pressed() -> void:
	$Window.hide()


func _on_hub_button_pressed() -> void:
	if $Window.visible:
		$Window.grab_focus()
	elif $Hub.visible:
		$Hub.grab_focus()


func _on_dog_button_pressed() -> void:
	dogtop.get_child(0).grab_focus()


func _on_robot_button_pressed() -> void:
	robtop.get_child(0).grab_focus()


func _on_cult_button_pressed() -> void:
	cultop.get_child(0).grab_focus()
