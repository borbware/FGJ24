extends StaticBody3D

var reloaded = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	if body.is_in_group("Player") and reloaded == false:
		reloaded = true
		get_node("AudioStreamPlayer").play()
		await get_tree().create_timer(4).timeout
		get_tree().reload_current_scene()
