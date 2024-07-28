extends dummy3D

### CONST ###
const GRAVITY : Vector3 = 40 * Vector3.DOWN

### EXPORT VARIABLE ###
@export_range(3.0,12.0,0.1) var max_speed : float = 6
@export_range(3.0,12.0,0.1) var steering_factor : float = 20

### On Ready ###
@onready var player_detection_area = $player_detection_area

### VARIABLE ###
var target : CharacterBody3D

func on_character_exit_area (area : Area3D):
	if(area.owner is PlayerCharacter):
		print("ok pas")
		target = null
	pass

func _process(delta):
	if(target != null):
		deplacement_character(delta)
		move_and_slide()
		pass
	pass

func deplacement_character(delta:float)-> void :
	var direction : Vector3 
	direction = target.position - position
	
	var desired_ground_velocity := max_speed * direction
		
	var steering_vector := desired_ground_velocity - velocity
	steering_vector.y = 0.0
	
	var steering_amount: float = min(steering_factor * delta, 1.0)
	velocity += GRAVITY * delta
	velocity += steering_vector * steering_amount
	pass


func _on_player_detection_area_area_entered(area):
	print("pp")
	if(area.owner is PlayerCharacter):
		print("ok")
		target = area.owner
	pass # Replace with function body.


func _on_player_detection_area_area_exited(area):
	print("pp")
	if(area.owner is PlayerCharacter):
		print("pas ok")
		target = null
	pass # Replace with function body.
