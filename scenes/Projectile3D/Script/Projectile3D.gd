class_name Projectile3D 
extends HitBox3D

### ONREADY ###


## The speed of the projectile in meters per second.
@export var speed := 10.0
## The maximum range of the projectile in meters.
var max_range := 10.0

# The distance the projectile has traveled so far.
var _traveled_distance := 0.0	

### EXPORT ###
@export var attack_size := 2.0
@export var attack_size2 := 2

func _ready():
	hit_hurt_box.connect(_on_hit)
	pass

func cast():
	visible = true
	set_physics_process(true)
	monitorable = true
	monitoring = true
	pass

func _process(delta: float) -> void:
	#if Engine.is_editor_hint():
		#return
		#
	#var distance := speed * delta
	#var motion := -transform.basis.z * distance
#
	#position += motion
	#
	#_traveled_distance += distance
	#if _traveled_distance > max_range:
		#_destroy()
	pass

func _destroy() -> void:
	set_physics_process(false)
	visible = false
	hit_hurt_box.disconnect(_on_hit)
	monitorable = false
	monitoring = false
	pass

func _on_hit(_node: Node3D):
	_destroy()
	pass
