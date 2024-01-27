extends Node3D

var arm1 = null
var arm2 = null
@export var rotation_strength: float
var left_stick : Vector2
var right_stick : Vector2

func _ready():
	arm1 = get_node("Arm1").get_node("ArmBody")
	arm2 = get_node("Arm2").get_node("ArmBody")
	pass # Replace with function body.
	

func _process(delta):
	left_stick = Vector2(
		Input.get_axis("left_stick_left", "left_stick_right"),
		Input.get_axis("left_stick_up", "left_stick_down")
	)
	right_stick = Vector2(
		Input.get_axis("right_stick_left", "right_stick_right"),
		Input.get_axis("right_stick_up", "right_stick_down")
	)

func _physics_process(delta):
	var left_stick_angle = left_stick.angle()
	var right_stick_angle = right_stick.angle()
	# print(left_stick_angle)
	if left_stick:
		arm2.apply_torque(Vector3(0, 0, left_stick_angle * rotation_strength))
	if right_stick:
		arm1.apply_torque(Vector3(0, 0, right_stick_angle * rotation_strength))
