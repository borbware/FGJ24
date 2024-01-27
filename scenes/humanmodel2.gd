extends Node3D

var LeftHandTarget
var RightHandTarget
var LeftShoulder
var RightShoulder
var LeftHand
var RightHand
var IKleft
var IKright
var left_stick : Vector2
var right_stick : Vector2
var size = 1
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

var DebugHoldLeft

func _ready():
	var skeleton = $ego/ego_rig/Skeleton3D
	skeleton.physical_bones_start_simulation()
	IKleft = skeleton.get_node("SkeletonIK3DLeft")
	IKright = skeleton.get_node("SkeletonIK3DRight")
	LeftShoulder = skeleton.get_node("Physical Bone DEF-shoulder_L")
	RightShoulder = skeleton.get_node("Physical Bone DEF-shoulder_R")
	LeftHand = skeleton.get_node("Physical Bone DEF-forearm_L_001")
	RightHand = skeleton.get_node("Physical Bone DEF-forearm_R_001")
	LeftHandTarget = get_parent().get_node("LeftHandTarget")
	RightHandTarget = get_parent().get_node("RightHandTarget")
	DebugHoldLeft = get_parent().get_node("LeftHold")
	# IKleft.start()
	# IKright.start()
	# set_target_to_hold(LEFT, DebugHoldLeft)

func set_target_to_hold(side, target):
	var IK = IKleft if side == LEFT else IKright  
	IK.target_node = target
	if side == LEFT:
		left_mode = HOLD_TO_HANDLE
	elif side == RIGHT:
		right_mode = HOLD_TO_HANDLE

func _process(delta):
	left_stick = Vector2(
		Input.get_axis("left_stick_left", "left_stick_right"),
		Input.get_axis("left_stick_up", "left_stick_down")
	)
	right_stick = Vector2(
		Input.get_axis("right_stick_left", "right_stick_right"),
		Input.get_axis("right_stick_up", "right_stick_down")
	)
	LeftHandTarget.global_position = LeftShoulder.global_position + Vector3(left_stick.x, -left_stick.y, 0) * size
	RightHandTarget.global_position = RightShoulder.global_position + Vector3(right_stick.x, -right_stick.y, 0) * size


func _physics_process(delta):
	pass
	# LeftHand.global_position = DebugHoldLeft.global_position
	# print(LeftHand.global_position)
