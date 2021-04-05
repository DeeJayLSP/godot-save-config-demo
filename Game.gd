extends Control

onready var monitor = $List/CurrentData
onready var variable = $List/Modifiers/AddOverwriteVar
onready var value = $List/Modifiers/AddOverwriteVal
onready var overwrite = $List/Modifiers/Types

var data = Userdata.session_data

func _ready():
	#Convert the session dictionary into a string to show on screen;
	monitor.text = str(data)

#Detects Apply button press and applies the variables to the data;
func _on_AOApply_pressed():
	var set_variable = variable.text
	var set_value = value.text
	var overwrite_state = !overwrite.pressed
	Userdata.gather_data({set_variable: set_value}, overwrite_state)
	_ready()

#Call the function to save the session dictionary on file
func _on_Save_pressed():
	Userdata.save_data()

#Exits and opens the main menu;
func _on_Back_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
