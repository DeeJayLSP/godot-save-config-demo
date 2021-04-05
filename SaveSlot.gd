extends Button

#This script handles every save slot on Play screen;

#The following variable will be replaced once Play readies;
var save_exists := false
var slot : int

#Separate signal intended to send the slot to Play screen/
signal slot_pressed(slot)

func _on_pressed():
	#Identifies which slot is this;
	slot = get_index() + 1
	#Opens the "Game" screen, or sends a signal to create a save file;
	if save_exists:
		Userdata.load_data(slot)
		get_tree().change_scene("res://Game.tscn")
	else:
		emit_signal("slot_pressed", slot)