class_name HurtBox3D
extends Area3D

### CONST ###
const DAMAGE_SOURCE_PLAYER := 1
const DAMAGE_SOURCE_MOB := 2

### Signal ###
signal took_hit(hitbox: HitBox3D)

### EXPORT ###
@export_flags("Player","Mob") var damage_source = DAMAGE_SOURCE_PLAYER : set = set_damage_source
@export_flags("Player","Mob") var detected_hurtbox = DAMAGE_SOURCE_PLAYER : set = set_detected_sources

func _init() -> void:
	monitoring = true
	monitorable = true
	area_entered.connect(func _on_area_entered(area: Area3D) -> void:
		if area is HurtBox3D:
			took_hit.emit(area)
	)
	pass

func set_damage_source(new_source : int) -> void :
	damage_source = new_source
	collision_layer = damage_source
	pass

func set_detected_sources(new_source : int) -> void:
	detected_hurtbox = new_source
	collision_mask = damage_source
	pass
