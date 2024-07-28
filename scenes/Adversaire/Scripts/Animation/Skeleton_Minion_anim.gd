extends Node3D

## Controls how much the dummy material's emission is blended with the original material. It turns the model red.
var _tween_damage: Tween = null

@onready var animation_player = %AnimationPlayer
@export var animation_damage : String

func play_hit_animation() -> void:
	if _tween_damage != null:
		_tween_damage.kill()
	
	#_tween_damage = create_tween()
	play_damage_animation()
	pass

func play_damage_animation():
	var tween = create_tween()
	var rotate = randi_range(0,1)
	if(rotate == 0):
		tween.tween_property(self,"rotation:y",-0.5,0.15).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BOUNCE)
		tween.tween_property(self,"rotation:y",0.3,0.15).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CIRC)
		tween.tween_property(self,"rotation:y",0,0.15)
	else :
		tween.tween_property(self,"rotation:y",0.5,0.15).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_BOUNCE)
		tween.tween_property(self,"rotation:y",-0.3,0.15).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CIRC)
		tween.tween_property(self,"rotation:y",0,0.15)
	pass


func play_death_animation() -> void:
	if _tween_damage != null:
		_tween_damage.kill()

	_tween_damage = create_tween()
	_tween_damage.tween_property(self,"rotation:x",-1,0.5).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_EXPO)
	await _tween_damage.finished
	owner.queue_free()
