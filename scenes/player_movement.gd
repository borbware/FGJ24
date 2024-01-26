extends Node3D

var arm1 = null
var arm2 = null
@export var rotation_strength: float

func _ready():
	arm1 = get_node("Arm1")
	arm2 = get_node("Arm2")
	pass # Replace with function body.

func _process(delta):
	var left_stick = Vector2(
		Input.get_axis("left_stick_left", "left_stick_right"),
		Input.get_axis("left_stick_up", "left_stick_down")
	)
	var right_stick = Vector2(
		Input.get_axis("right_stick_left", "right_stick_right"),
		Input.get_axis("right_stick_up", "right_stick_down")
	)
	print(rotation_strength)
	if left_stick:
		arm1.rotation = Vector3(0, left_stick.x, left_stick.y) * rotation_strength;
	if right_stick:
		arm1.rotation = Vector3(0, right_stick.x, right_stick.y) * rotation_strength;
