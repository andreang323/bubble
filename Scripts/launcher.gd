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
	dogtop.get_child(0).topic = 2
	dogtop.visible = false
	robtop = RobotTopic.instantiate()
	robtop.get_child(0).topic = 1
	robtop.visible = false
	cultop = CultTopic.instantiate()
	cultop.get_child(0).topic = 0
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
