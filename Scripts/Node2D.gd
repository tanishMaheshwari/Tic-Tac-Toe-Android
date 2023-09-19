extends Node2D


func _ready():
	get_tree().set_quit_on_go_back(false)

func _on_quit_button_button_up():
	get_tree().quit()
	pass # Replace with function body.

func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_Back_Pressed()
		pass
func _on_Back_Pressed():
	#get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")
	get_tree().quit()

func _on_play_button_button_up():
	get_tree().change_scene_to_file("res://Scenes/game_scene_1.tscn")
	pass # Replace with function body.


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")
	pass # Replace with function body.
