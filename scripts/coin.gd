extends Area2D
@onready var game_manager = %Game_manager
@onready var coinsound = $coinsound
@onready var coinsfx = null

func _on_ready():
	collision_layer = 4


# For some reason, certain scripts don't play the sound like this one (code works)
func _on_body_entered(body):
	if game_manager:
		game_manager.add_point(5)
		queue_free()
