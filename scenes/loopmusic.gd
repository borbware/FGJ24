extends AudioStreamPlayer

func _ready():
	await get_tree().create_timer(60*1+48).timeout
	get_tree().reload_current_scene() 
