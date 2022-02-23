extends Popup

# Video Settings
onready var display_options = $SettingTabs/Video/MarginContainer/VideoSettings/DisplayOptions
onready var vsync_btn = $SettingTabs/Video/MarginContainer/VideoSettings/VsyncBtn
onready var display_fps_btn = $SettingTabs/Video/MarginContainer/VideoSettings/DisplayFpsBtn
onready var max_fps_val = $SettingTabs/Video/MarginContainer/VideoSettings/MaxFpsOption/MaxFpsVal
onready var max_fps_slider = $SettingTabs/Video/MarginContainer/VideoSettings/MaxFpsOption/MaxFpsSlider
onready var bloom_btn = $SettingTabs/Video/MarginContainer/VideoSettings/BloomBtn
onready var brightness_slider = $SettingTabs/Video/MarginContainer/VideoSettings/BrightnessSlider

# Audio Settings
onready var master_slider = $SettingTabs/Audio/MarginContainer2/AudioSettings/MasterSlider
onready var music_slider = $SettingTabs/Audio/MarginContainer2/AudioSettings/MusicSlider
onready var sfx_slider = $SettingTabs/Audio/MarginContainer2/AudioSettings/SfxSlider

# Gameplay Settings
onready var fov_amount = $SettingTabs/GamePlay/MarginContainer3/GameplaySettings/FovOption/FovAmount
onready var fov_slider = $SettingTabs/GamePlay/MarginContainer3/GameplaySettings/FovOption/FovSlider
onready var mouse_sens_amount = $SettingTabs/GamePlay/MarginContainer3/GameplaySettings/MouseSensOption/MouseSensAmount
onready var mouse_slider = $SettingTabs/GamePlay/MarginContainer3/GameplaySettings/MouseSensOption/MouseSlider


func _ready():
	
	display_options.select(1 if Save.game_data.fullscreen_on else 0)
	Globalsettings.toggle_fullscreen(Save.game_data.fullscreen_on)
	vsync_btn.pressed = Save.game_data.vsync_on
	display_fps_btn.pressed = Save.game_data.display_fps
	max_fps_slider.value = Save.game_data.max_fps
	bloom_btn.pressed = Save.game_data.bloom_on
	brightness_slider.value = Save.game_data.brightness
	
	master_slider.value = Save.game_data.master_vol
	
	fov_slider.value = Save.game_data.fov
	mouse_slider.value = Save.game_data.mouse_sens
	


func _on_OptionButton_item_selected(index):
	Globalsettings.toggle_fullscreen(true if index == 1 else false)


func _on_CheckButton_toggled(button_pressed):
	Globalsettings.toggle_vsync(button_pressed)


func _on_DisplayFpsBtn_toggled(button_pressed):
	Globalsettings.toggle_fps_display(button_pressed)
	
	
func _on_MaxFpsSlider_value_changed(value):
	Globalsettings.set_max_fps(value)
	max_fps_val.text = str(value) if value < max_fps_slider.max_value else "max"


func _on_BloomBtn_toggled(button_pressed):
	Globalsettings.toggle_bloom(button_pressed)
	

func _on_BrightnessSlider_value_changed(value):
	Globalsettings.update_brightness(value)


func _on_MasterSlider_value_changed(value):
	Globalsettings.update_master_vol(value)


func _on_FovSlider_value_changed(value):
	Globalsettings.update_fov(value)
	fov_amount.text = str(value)
	

func _on_MouseSlider_value_changed(value):
	Globalsettings.update_mouse_sens(value)
	mouse_sens_amount.text = str(value)
	
