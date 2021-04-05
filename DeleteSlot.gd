extends Button

var save_exists := false
var slot : int

signal slot_pressed(slot)

func _on_pressed():
	slot = get_index() + 1
	if save_exists:
		emit_signal("slot_pressed", slot)
