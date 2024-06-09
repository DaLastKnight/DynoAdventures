extends Node2D
@onready var playbutton = $playbutton
@onready var titletext = $titletext
@onready var animation_player = $Instructions/AnimationPlayer
@onready var scene = null
@onready var scene_instance = null
@onready var pressnum = 0




func _on_playbutton_pressed(): # When you click to play, the controls appear & the title and this button disappears
		if pressnum != 1:
			titletext.queue_free()
			playbutton.queue_free()
			animation_player.play("instructions_appear")
			pressnum += 1
			return
		
	
	
func _on_pressplay_pressed(): # The instructions appear first THEN you can change scene
	if animation_player.is_playing():
		await animation_player.animation_finished
	scene = ResourceLoader.load("res://scenes/game.tscn")
	
	if scene:
		get_tree().change_scene_to_file("res://scenes/game.tscn")
	else:
		print("Failed to load scene")
	
	
	
	
