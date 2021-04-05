extends Control

onready var slots = $Options
onready var confirmation = $Fade

func _ready():
	for option in slots.get_child_count():
		#Exit loop after configuring 3rd slot;
		if option > 2:
			break
		#Check if there's a save file with a name;
		var slot_name = Userdata.check_data(option)
		#If there is a name, rename the button label to it;
		if slot_name: 
			slots.get_child(option).text = "Delete %s" %slot_name
			slots.get_child(option).save_exists = true
		else:
			slots.get_child(option).disabled = true

func _on_Back_pressed():
	get_tree().change_scene("res://Play.tscn")

func _on_slot_pressed(slot):
	print("Slot pressed: %d" %slot)
	Userdata.active_slot = slot
	confirmation.show()

func _on_Yes_pressed():
	confirmation.hide()
	Userdata.erase_data()
	get_tree().reload_current_scene()

func _on_No_pressed():
	confirmation.hide()

func _input(event):
	if event.is_action_pressed("ui_cancel"): confirmation.hide()
	if confirmation.visible:
		if event.is_action_pressed("ui_accept"): _on_Yes_pressed()
