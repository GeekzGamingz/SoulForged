extends Node3D
#------------------------------------------------------------------------------#
#Unhandled Input
func _unhandled_input(event: InputEvent):
	#Killswitch
	if event.is_action_pressed("ESC"): get_tree().quit()
