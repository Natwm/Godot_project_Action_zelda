class_name HitBox3D
extends Area3D

### CONST ###
const DAMAGE_SOURCE_PLAYER := 1
const DAMAGE_SOURCE_MOB := 2

### Signal ###
signal hit_hurt_box (hitbox: HurtBox3D)

### EXPORT ###
@export_flags("Player","Mob") var damage_source = DAMAGE_SOURCE_PLAYER : set = set_damage_source
@export_flags("Player","Mob") var detected_hurtboxes = DAMAGE_SOURCE_PLAYER : set = set_detected_hurtboxes

func _init():
	monitorable = true
	monitoring = true
	area_entered.connect(func on_area_entered(area : Area3D)-> void :
		if(area is HitBox3D):
			hit_hurt_box.emit(area)
		)
	pass

func set_damage_source(new_source : int) -> void :
	damage_source = new_source
	collision_mask = damage_source
	pass

func set_detected_hurtboxes(new_source : int) -> void :
	detected_hurtboxes = detected_hurtboxes
	collision_layer = detected_hurtboxes
	pass
