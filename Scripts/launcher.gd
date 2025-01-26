extends Control

var DogTopic = preload("res://topic.tscn")
var RobotTopic = preload("res://topic.tscn")
var CultTopic = preload("res://topic.tscn")

var dogtop
var robtop
var cultop

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Window.hide()
	$Hub.hide()

func _on_texture_rect_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.is_double_click():
		$Window.show()


func _on_start_pressed() -> void:
	$Window.hide()
	$Hub.show()
	dogtop = DogTopic.instantiate()
	dogtop.topic = UserTopics.Topics.DOG
	dogtop.visible = false
	robtop = RobotTopic.instantiate()
	robtop.topic = UserTopics.Topics.ROBOTS
	robtop.visible = false
	cultop = CultTopic.instantiate()
	cultop.topic = UserTopics.Topics.CULT
	cultop.visible = false
	add_child(dogtop)
	add_child(robtop)
	add_child(cultop)


func _on_dog_bubble_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.is_double_click():
		dogtop.show()


func _on_cult_bubble_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.is_double_click():
		cultop.show()


func _on_robot_bubble_gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.is_pressed() and event.is_double_click():
		robtop.show()


# GET TOPIC CURRENT SIZE, RESIZE BUBBLES
