extends WorldEnvironment


func _ready():
	Globalsettings.connect("bloom_toggled", self, "_on_bloom_toggled")
	Globalsettings.connect("brightness_updated", self, "_on_brightness_updated")
	

func _on_bloom_toggled(value):
	environment.glow_enabled = value
	environment.glow_bloom = 1
	

func _on_brightness_updated(value):
	environment.adjustment_brightness = value

