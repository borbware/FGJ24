extends RigidBody3D

@export_group("Assets")
@export var hurt_noises: Array[AudioStreamWAV]

func _ready():
	pass # Replace with function body.

func _process(delta):
	pass

func _on_area_3d_body_entered(body):
	if body.is_in_group("Player"):
		var Audiostream = get_node("AudioStreamPlayer")
		Audiostream.stream = hurt_noises.pick_random()
		Audiostream.play()
