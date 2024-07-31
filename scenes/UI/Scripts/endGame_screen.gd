extends Control


@onready var restart_button = %restart_button
@onready var quit_button = %quit_Button

func _ready():
	visible = false
	quit_button.pressed.connect(quit_game)
	restart_button.pressed.connect(reload_game)
	pass

func _set_game_over_screen():
	visible = true
	pass

func quit_game():
	get_tree().root.propagate_notification(NOTIFICATION_WM_CLOSE_REQUEST)
	get_tree().quit()
	pass

func reload_game():
	get_tree().reload_current_scene()
	pass
