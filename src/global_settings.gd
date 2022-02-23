extends Node

signal display_fps(value)
signal bloom_toggled(value)
signal brightness_updated(value)
signal fov_updated(value)
signal mouse_sens_updated(value)

#var is_fps_displayed = false
#var fov_amount = 70

#func _ready():
#	pass
##	set_max_fps(70)


func update_master_vol(vol):
	AudioServer.set_bus_volume_db(0, vol)
	Save.game_data.master_vol = vol
	print(vol)
	Save.save_data()
	
	
func update_music_vol(vol):
	AudioServer.set_bus_volume_db(1, vol)
	
		
func update_sfx_vol(vol):
	AudioServer.set_bus_volume_db(2, vol)
	
	
func toggle_fullscreen(toggle):
	OS.window_fullscreen = toggle
	Save.game_data.fullscreen_on = toggle
	print("fullscreen")
	Save.save_data()
	
	
func toggle_vsync(toggle):
	OS.vsync_enabled = toggle
	Save.game_data.vsync_on = toggle
	Save.save_data()
	
	
func toggle_fps_display(toggle):
	emit_signal("display_fps", toggle)
	Save.game_data.display_fps = toggle
	Save.save_data()
	
	
func set_max_fps(value):
	Engine.target_fps = value if value < 500 else 0
	Save.game_data.max_fps = Engine.target_fps if value < 500 else 500
	Save.save_data()
	
	
func toggle_bloom(value):
	emit_signal("bloom_toggled", value)
	Save.game_data.bloom_on = value
	Save.save_data()
	
	
func update_brightness(value):
	emit_signal("brightness_updated", value)
	Save.game_data.brightness = value
	Save.save_data()
	
	
func update_fov(value):
	emit_signal("fov_updated", value)
	Save.game_data.fov = value
	Save.save_data()
	
	
func update_mouse_sens(value):
	emit_signal("mouse_sens_updated", value)
	Save.game_data.mouse_sens = value
	Save.save_data()
	
	

