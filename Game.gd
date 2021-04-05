extends Control

onready var monitor = $List/CurrentData
onready var variable = $List/Modifiers/AddOverwriteVar
onready var value = $List/Modifiers/AddOverwriteVal
onready var overwrite = $List/Modifiers/Types

var data = Userdata.session_data

func _ready():
	monitor.text = str(data)

func _on_AOApply_pressed():
	var set_variable = variable.text
	var set_value = value.text
	var overwrite_state = !overwrite.pressed
	Userdata.gather_data({set_variable: set_value}, overwrite_state)
	_ready()

func _on_Save_pressed():
	Userdata.save_data()

func _on_Back_pressed():
	get_tree().change_scene("res://MainMenu.tscn")
