extends Node


func _ready():
	var skeleton = $ego/ego_rig/Skeleton3D
	skeleton.physical_bones_start_simulation()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
