extends StaticBody2D


@onready var deathsound = $deathsound

# I just made a collision area at the bottom of the game so that
# when the player drops off the world, they reset

func _on_area_2d_body_entered(body):
	deathsound.play()
	if body.name == "Player":
		get_tree().reload_current_scene()
