class_name dummy3D
extends CharacterBody3D

@onready var dummy_skin = %DummySkin
@onready var hurt_box_3d = %HurtBox3D
@onready var health_manager : Health_Manager = %HealthManager


func _ready() -> void:
	hurt_box_3d.took_hit.connect(_on_hurt_box_took_hit)
	health_manager.Character_is_dead.connect(death)


func _on_hurt_box_took_hit(hitbox : HitBox3D) -> void:
	dummy_skin.play_hit_animation()
	health_manager.take_damage()
	pass

func death():
	print ("death")
	dummy_skin.play_death_animation()
	#queue_free()
	pass
