extends Node3D


func _ready():
	get_node("ego_rig/Skeleton3D").physical_bones_start_simulation()

func _process(delta):
	pass
