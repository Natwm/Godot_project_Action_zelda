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
	
	var mouse_position = get_viewport().get_mouse_position()
	var mouse_ray = camera_3d.project_ray_normal(mouse_position)
	var world_mouse_posisition = _world_plane.intersects_ray(camera_3d.global_position,mouse_ray)
	
	if( world_mouse_posisition != null):
		gobot_skin_3d.look_at(world_mouse_posisition)
	
	pass
