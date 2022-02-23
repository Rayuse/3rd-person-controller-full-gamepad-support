extends Node

onready var world_env = $WorldEnvironment

func _ready():
	world_env.environment.dof_blur_far_enabled = false
	world_env.environment.dof_blur_near_enabled = false
	Music.stream = load("res://assets/music/BrandonMorris-LoadingScreenLoop-cc0-qmix.mp3")
	Music.play()
