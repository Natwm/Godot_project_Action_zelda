extends CharacterBody3D

### CONST ###

const GRAVITY : Vector3 = 40 * Vector3.DOWN

### EXPORT VARIABLE ###
@export_range(3.0,12.0,0.1) var max_speed : float = 6
@export_range(3.0,12.0,0.1) var steering_factor : float = 20

### On Ready ###
@onready var gobot_skin_3d = %GobotSkin3D
@onready var camera_3d = %Camera3D

### VAR ###
var _world_plane := Plane(Vector3.UP)


func _physics_process(delta):
	_world_plane.d = global_position.y
	deplacement_character(delta)
	rotation_character_with_mouse()
	move_and_slide()
	pass

func deplacement_character(delta:float)-> void :
	var input_direction  = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction : Vector3 = Vector3(input_direction.x,0.0, input_direction.y)
	
	if(input_direction != Vector2.ZERO):
		var target_angle := Vector3.FORWARD.angle_to(direction)
		if(direction.x != 0.0) :
			target_angle *= -sign(direction.x)
		gobot_skin_3d.hips_rotation = target_angle - gobot_skin_3d.rotation.y
	
	var desired_ground_velocity := max_speed * direction
	var steering_vector := desired_ground_velocity - velocity
	steering_vector.y = 0.0
	
	var steering_amount: float = min(steering_factor * delta, 1.0)
	velocity += GRAVITY * delta
	velocity += steering_vector * steering_amount
	play_animation(direction)
	pass

func rotation_character_with_mouse () -> void:
	var mouse_position = get_viewport().get_mouse_position()
	var mouse_ray = camera_3d.project_ray_normal(mouse_position)
	var world_mouse_posisition = _world_plane.intersects_ray(camera_3d.global_position,mouse_ray)
	
	if( world_mouse_posisition != null):
		gobot_skin_3d.look_at(world_mouse_posisition)
	pass

func play_animation(direction : Vector3) -> void:
	if(is_on_floor() and not direction.is_zero_approx()):
		gobot_skin_3d.run()
		pass
	else :
		gobot_skin_3d.idle()		
		pass 
	
	if (not is_on_floor()) :
		gobot_skin_3d.fall()
		pass
	pass
