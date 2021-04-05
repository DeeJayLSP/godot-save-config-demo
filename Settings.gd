extends Control

#The amount of possible values in volume slider + 1 (since zero counts as minimum);
#This will also become the max value of every slider;
const VOLUME_FRACTIONS := 50

#Attach everything to a variable;
onready var master_volume := $List/MasterVolume
onready var music_volume := $List/MusicVolume
onready var effects_volume := $List/Effects/EffectsVolume
onready var effects_test := $List/Effects/Test
#The following two point to the resolution fields;
onready var window_w := $List/WindowSize/Width
onready var window_h := $List/WindowSize/Height
onready var sfx := $SFX
#This variable will read the resolution set in settings;
onready var window : Vector2 = Userdata.get_config("window_size")

func _ready():
	window_w.text = str(window.x)
	window_h.text = str(window.y)
	#Multiply volumes by 100 since slider doesn't support floats;
	master_volume.max_value = VOLUME_FRACTIONS
	master_volume.value = Userdata.get_config("volume_master") * VOLUME_FRACTIONS
	music_volume.max_value = VOLUME_FRACTIONS
	music_volume.value = Userdata.get_config("volume_music") * VOLUME_FRACTIONS
	effects_volume.max_value = VOLUME_FRACTIONS
	effects_volume.value = Userdata.get_config("volume_sfx") * VOLUME_FRACTIONS

#Divide volumes by 100 to store as linear;
func _on_MasterVolume_value_changed(value):
	Userdata.save_config("volume_master", value/VOLUME_FRACTIONS)

func _on_MusicVolume_value_changed(value):
	Userdata.save_config("volume_music", value/VOLUME_FRACTIONS)

func _on_EffectsVolume_value_changed(value):
	Userdata.save_config("volume_sfx", value/VOLUME_FRACTIONS)

func _on_Apply_pressed():
	window = Vector2(int(window_w.text), int(window_h.text))
	if window.x == 0: window.x = 1024
	if window.y == 0: window.y = 600
	Userdata.save_config("window_size", window)
	Userdata.load_config()

func _on_Back_pressed():
	get_tree().change_scene("MainMenu.tscn")

func _on_Test_pressed():
	var rng = randi() % 2+1
	sfx.stream = load("res://sfx/sfx%d.wav" %rng)
	sfx.play()
