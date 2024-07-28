extends Node3D
class_name Health_Manager

### EXPORT ###
@export var health := 500

### SIGNAL ###
signal Character_is_dead
signal Character_is_damaged(value :int)

func take_damage(damage : int = 1):
	if(is_dead()) :
		return
	health -= damage
	Character_is_damaged.emit(health)
	if(is_dead()) :
		death()
	pass

func is_dead()->bool:
	return health <= 0
	pass

func death():
	print ("death")
	Character_is_dead.emit()
	#queue_free()
	pass
