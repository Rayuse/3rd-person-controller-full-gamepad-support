extends CanvasLayer


onready var settings_menu = $SettingsMenu
onready var start_btn = $MainMenu/MarginContainer/VBoxContainer/StartGameBtn

func _ready():
	start_btn.grab_focus()

func _on_StartGameBtn_pressed():
	get_tree().change_scene("res://src/levels/game.tscn")


func _on_SettingsBtn_pressed():
	settings_menu.popup_centered()


func _on_ExitBtn_pressed():
	get_tree().quit()
