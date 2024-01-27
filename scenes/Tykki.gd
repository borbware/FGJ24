extends Node3D

@export var ammo_prefab : PackedScene

@export var force: float
@export var rotate_ground_speed: float
@export var rotate_up_speed: float
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func shoot():
	var ammo = ammo_prefab.instantiate()
	get_parent().get_node("Ammos").add_child(ammo)
	ammo.global_position = $Tykki/AmmoSpawn.global_position
	ammo.apply_impulse(-$Tykki.get_global_transform().basis.z * force)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var left_stick = Vector2(
		Input.get_axis("left_stick_left", "left_stick_right"),
		Input.get_axis("left_stick_up", "left_stick_down")
	)
	var right_stick = Vector2(
		Input.get_axis("right_stick_left", "right_stick_right"),
		Input.get_axis("right_stick_up", "right_stick_down")
	)
	
	$Tykki.rotate_y(-left_stick.x * rotate_ground_speed * delta)
	# $Tykki.rotate_object_local($Tykki.global_transform.basis.z, -right_stick.y * rotate_up_speed * delta)
	$Tykki.rotate_object_local($Tykki.global_transform.basis.x, right_stick.y * rotate_up_speed * delta)
	
	
	if Input.is_action_just_pressed("button_a"):
		shoot()
