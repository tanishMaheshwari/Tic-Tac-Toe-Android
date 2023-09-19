extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/Label2.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

#func _notification(what):
#    if what == NOTIFICATION_WM_GO_BACK_REQUEST:
#        _on_Back_pressed()
#    if what == NOTIFICATION_WM_QUIT_REQUEST:
#        _on_Back_pressed()

func _notification(what):
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		_on_Back_Pressed()
		pass
func _on_Back_Pressed():
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")


func _on_button_pressed():
	Global.score = [0, 0]
	$MarginContainer/VBoxContainer/Label2.visible = true
	pass # Replace with function body.


func _on_button_2_pressed():
	get_tree().change_scene_to_file("res://Scenes/node_2d.tscn")
	pass # Replace with function body.
