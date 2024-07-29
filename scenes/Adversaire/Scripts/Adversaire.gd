class_name base_Adversaire
extends dummy3D

### CONST ###
const GRAVITY : Vector3 = 40 * Vector3.DOWN

### EXPORT VARIABLE ###
@export var _state : = Enum_State.States.IDLE

@export_category("Statistics")
@export_range(3.0,12.0,0.1) var max_speed : float = 6
@export_range(3.0,12.0,0.1) var steering_factor : float = 20

### On Ready ###
@onready var player_detection_area = $player_detection_area
@onready var state_manager : StateMachine = $StateManager

### VARIABLE ###
var target : CharacterBody3D


func _process(delta):
	#if(target != null):
		#deplacement_character(delta)
		#move_and_slide()
		#pass
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

### States Pattern ###
func change_state(new_state: int) -> void:
	var previous_state := _state
	_state = new_state

	# Initialize the new state.
	match _state:
		Enum_State.States.IDLE :
			pass
		Enum_State.States.PATROL :
			pass
		Enum_State.States.CHASING :
			pass
		Enum_State.States.ATTACK :
			pass
		Enum_State.States.DEATH :
			pass

	# Clean up the previous state.
	match previous_state:
		Enum_State.States.IDLE :
			pass
		Enum_State.States.PATROL :
			pass
		Enum_State.States.CHASING :
			pass
		Enum_State.States.ATTACK :
			pass
		Enum_State.States.DEATH :
			pass

### Signals Connexion ###
func _on_player_detection_area_area_entered(area):
	print("pp")
	if(area.owner is PlayerCharacter):
		print("ok")
		target = area.owner
		state_manager.transition_to("CHASING")
	pass # Replace with function body.

func _on_player_detection_area_area_exited(area):
	print("pp")
	if(area.owner is PlayerCharacter):
		print("pas ok")
		state_manager.transition_to("IDLE")
		target = null
	pass # Replace with function body.
