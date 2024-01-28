extends Node3D

var win = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_area_shape_entered(area_rid, area, area_shape_index, local_shape_index):
	pass
	#var object = area.get_parent()
	#print(object)
	#if object.is_in_group("Player"):
		#var nextScene = preload("res://scenes/title_screen.tscn")
		#get_tree().change_scene(nextScene)
#


func _on_area_3d_body_entered(body):
	var object = body.get_parent()
	print(body)
	if body.is_in_group("Player") and win == false:
		win = true
		get_node("AudioStreamPlayer").play()
		await get_tree().create_timer(1).timeout
		get_tree().change_scene_to_file("res://scenes/win.tscn")
	elif body.is_in_group("Ammo"):
		body.queue_free()



