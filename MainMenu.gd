extends Control

func _ready():
	#Set session data back to default when accessing main menu;
	Userdata.session_data = Userdata.default_data

func _on_Play_pressed():
	get_tree().change_scene("res://Play.tscn")

func _on_Settings_pressed():
	get_tree().change_scene("res://Settings.tscn")