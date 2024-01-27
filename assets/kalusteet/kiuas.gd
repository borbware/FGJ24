extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_area_entered(area):
	var object = area.get_parent()
	if object.is_in_group("Player"):
		var nextScene = preload("res://scenes/title_screen.tscn")
		get_tree().change_scene(nextScene)
