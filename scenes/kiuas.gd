extends Node3D

@export var nextLevel = "res://scenes/win.tscn" 
var win = false

func _on_area_3d_body_entered(body):
	var object = body.get_parent()
	print(body)
	if body.is_in_group("Player") and win == false:
		win = true
		get_node("AudioStreamPlayer").play()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file(nextLevel)
	elif body.is_in_group("Ammo"):
		body.queue_free()
