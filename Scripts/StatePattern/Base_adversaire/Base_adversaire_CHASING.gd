extends State

func update(_delta: float) -> void:
	var direction : Vector3 
	print("taget = " + str(owner.target.position))
	print("Owner = " + str(owner.position))
	direction = owner.target.position - owner.position
	
	var desired_ground_velocity :Vector3 = owner.max_speed * direction
		
	var steering_vector :Vector3 = desired_ground_velocity - owner.velocity
	steering_vector.y = 0.0
	
	var steering_amount: float = min(owner.steering_factor * _delta, 1.0)
	owner.velocity += owner.GRAVITY * _delta
	owner.velocity += steering_vector * steering_amount
	owner.move_and_slide()
	pass


# Virtual function. Called by the state machine upon changing the active state. The `msg` parameter
# is a dictionary with arbitrary data the state can use to initialize itself.
func enter(_msg := {}) -> void:
	pass

# Virtual function. Called by the state machine before changing the active state. Use this function
# to clean up the state.
func exit() -> void:
	pass

