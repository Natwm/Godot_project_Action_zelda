@tool
@icon("res://assets/icons/hurt_box_3d.svg")
class_name HurtBox3D
extends Area3D

### CONST ###
const DAMAGE_SOURCE_PLAYER := 1
const DAMAGE_SOURCE_MOB := 2

### Signal ###
signal took_hit(hitbox: HitBox3D)

### EXPORT ###
@export_flags("Player","Mob") var damage_source = DAMAGE_SOURCE_PLAYER : set = set_damage_source
@export_flags("Player","Mob") var hurtbox_type = DAMAGE_SOURCE_PLAYER : set = set_hurtbox_type

func _init() -> void:
	monitoring = true
	monitorable = true
	area_entered.connect(func _on_area_entered(area: Area3D) -> void:
		print(area.owner.name)
		if area is HitBox3D:
			took_hit.emit(area)
	)
	pass

func set_damage_source(new_value: int) -> void:
	damage_source = new_value
	collision_mask = damage_source

func set_hurtbox_type(new_value: int) -> void:
	hurtbox_type = new_value
	collision_layer = hurtbox_type
