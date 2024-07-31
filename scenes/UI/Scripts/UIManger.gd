extends Control

@onready var end_game_screen = $endGame_screen
@onready var character_body_3d : PlayerCharacter= $"../CharacterBody3D"

func _ready():
	character_body_3d.player_is_dead.connect(func():end_game_screen._set_game_over_screen())
