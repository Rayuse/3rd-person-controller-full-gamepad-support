extends Label

func _ready():
	Globalsettings.connect("display_fps", self, "_on_displayed_fps")
	
func _process(delta):
	text = "FPS: %s" % [Engine.get_frames_per_second()]
	
func _on_displayed_fps(value):
	print(value)
	visible = value
