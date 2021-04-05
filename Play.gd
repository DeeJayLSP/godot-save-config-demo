extends Control

onready var slots = $Options
onready var new_file = $NewFile

func _ready():
	for option in slots.get_child_count():
		#Exit loop after configuring 3rd slot;
		if option > 2:
			break
		#Check if there's a save file with a name;
		var slot_name = Userdata.check_data(option + 1)
		#If there is a name, rename the button label to it;
		if slot_name: 
			slots.get_child(option).text = slot_name
			slots.get_child(option).save_exists = true

func _on_Back_pressed():
	get_tree().change_scene("res://MainMenu.tscn")

func _on_ManageSaves_pressed():
	get_tree().change_scene("res://Manage.tscn")

func _on_Enter_pressed():
	new_file.hide()
	Userdata.create_data($NewFile/Content/Field.text)
	get_tree().reload_current_scene()

func _on_slot_pressed(slot):
	print("Slot pressed: %d" %slot)
	Userdata.active_slot = slot
	new_file.show()

func _input(event):
	if event.is_action_pressed("ui_cancel"): new_file.hide()
	if new_file.visible:
		if event.is_action_pressed("ui_accept"): _on_Enter_pressed()
