extends Node3D


func _ready():
	get_node("ego/ego_rig/Skeleton3D").physical_bones_start_simulation()


func _physics_process(delta):
	pass
	# get_node("ego/ego_rig/Skeleton3D/Physical Bone DEF-forearm_L").position = Vector3(0,0,0)
