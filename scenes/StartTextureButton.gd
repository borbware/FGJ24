extends TextureButton


# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(self._button_pressed)

func _button_pressed():
	get_node("AudioStreamPlayer").play()
	get_parent().get_parent().get_node("Loading").visible = true
	await get_tree().create_timer(1).timeout 
	get_tree().change_scene_to_file("res://scenes/level_template.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
