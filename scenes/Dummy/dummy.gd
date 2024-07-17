class_name dummy3D
extends CharacterBody3D

@onready var dummy_skin = %DummySkin
@onready var hurt_box_3d = %HurtBox3D


func _ready() -> void:
	hurt_box_3d.took_hit.connect(_on_hurt_box_took_hit)

func _on_hurt_box_took_hit(hitbox : HitBox3D) -> void:
	dummy_skin.play_damage_animation()
	pass

func take_damage():
	pass

func is_dead():
	pass

func death():
	pass
