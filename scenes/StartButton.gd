extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	var playButton = $Button
	playButton.connect("pressed", self, "_on_PlayButton_pressed")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Load the game scene
	var gameScene = preload("res://level_template.tscn")
	
	# Transition to the game scene
	get_tree().change_scene(gameScene)
