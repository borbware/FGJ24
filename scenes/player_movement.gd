extends Node3D

var LeftHandTarget
var RightHandTarget
var LeftArm
var RightArm
var LeftHand
var RightHand

var LeftHandleJoint
var RightHandleJoint

var DebugHoldLeft

@export var rotation_strength: float
var left_stick : Vector2
var right_stick : Vector2
var size = 2

enum {
	LOOK_FOR_HANDLE,
	HOLD_TO_HANDLE
}
enum {
	LEFT,
	RIGHT
}
var left_mode = LOOK_FOR_HANDLE
var right_mode = LOOK_FOR_HANDLE

func _ready():
	LeftHandTarget = get_parent().get_node("LeftHandTarget")
	RightHandTarget = get_parent().get_node("RightHandTarget")
	LeftHand = $BodyBody/LeftArm/Hand
	RightHand = $BodyBody/RightArm/Hand
	# RightArm = get_node("RightArm").get_node("ArmBody")
	# LeftArm = get_node("LeftArm").get_node("ArmBody")
	DebugHoldLeft = get_parent().get_node("LeftHold")
	RightHandleJoint = $BodyBody/RightArm/HandleJoint
	LeftHandleJoint = $BodyBody/LeftArm/HandleJoint
	

func _process(delta):
	left_stick = Vector2(
		Input.get_axis("left_stick_left", "left_stick_right"),
		Input.get_axis("left_stick_up", "left_stick_down")
	)
	right_stick = Vector2(
		Input.get_axis("right_stick_left", "right_stick_right"),
		Input.get_axis("right_stick_up", "right_stick_down")
	)

	LeftHandTarget.global_position = $BodyBody/LeftShoulder.global_position + Vector3(left_stick.x, -left_stick.y, 0) * size
	RightHandTarget.global_position = $BodyBody/RightShoulder.global_position + Vector3(right_stick.x, -right_stick.y, 0) * size

	hold_to(DebugHoldLeft, LEFT)

func hold_to(target,hand):
	var joint = RightHandleJoint if hand == RIGHT else LeftHandleJoint
	joint.node_a = target.get_path()
	

func _physics_process(delta):
	LeftHand.global_position = DebugHoldLeft.global_position
	var left_stick_angle = left_stick.angle()
	var right_stick_angle = right_stick.angle()
	# print(left_stick_angle)
	#if left_stick:
		#LeftArm.apply_torque(Vector3(0, 0, left_stick_angle * rotation_strength))
	#if right_stick:
		#RightArm.apply_torque(Vector3(0, 0, right_stick_angle * rotation_strength))
