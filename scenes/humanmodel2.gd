extends Node3D

var LeftHandTarget
var RightHandTarget
var LeftShoulder
var RightShoulder
var left_stick : Vector2
var right_stick : Vector2
var size = 1

func _ready():
	var skeleton = $ego/ego_rig/Skeleton3D
	skeleton.physical_bones_start_simulation()
	var IKleft = skeleton.get_node("SkeletonIK3DLeft")
	var IKright = skeleton.get_node("SkeletonIK3DRight")
	LeftShoulder = skeleton.get_node("Physical Bone DEF-shoulder_L")
	RightShoulder = skeleton.get_node("Physical Bone DEF-shoulder_R")
	LeftHandTarget = get_parent().get_node("LeftHandTarget")
	RightHandTarget = get_parent().get_node("RightHandTarget")
	IKleft.start()
	IKright.start()

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
	# get_node("ego/ego_rig/Skeleton3D/Physical Bone DEF-forearm_L").position = Vector3(-1,2,4)
	pass
