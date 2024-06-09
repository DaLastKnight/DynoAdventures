extends Node2D

@onready var sprite_2d = $Sprite2D
@onready var animation_player = $AnimationPlayer
	

func _physics_process(_delta):
	var direction = Input.get_axis("move_left", "move_right")
	var direction2 = Vector2.ZERO
	
	
	
	# Determine direction of sword according to player input
	# I can't believe this took me 3 hours to figure out both animation and direction
	# So flabbergasted when I found the solution is merely switching between positive and negative of player position
	# I also learnt that a child node's origin (0,0) starts at the player and not the game scene itself :D
	if direction < 0:
		position.x = -7
		sprite_2d.flip_h = false
	elif direction > 0:
		position.x = 7
		sprite_2d.flip_h = true
	
	
	# These Vector2.DIRECTION is literally just Vector2(x,y) or Vector2(-x,y)
	if Input.is_action_pressed("move_left"):
		direction2 = Vector2.LEFT
	elif Input.is_action_pressed("move_right"):
		direction2 = Vector2.RIGHT
	
	if Input.is_action_just_pressed("use"):
		if direction2:
			if direction2 is Vector2:
				if direction2.x > 0:
					animation_player.play("slash_right")
				elif direction2.x < 0:
					animation_player.play("slash_left")
				else:
					return
			else:
				return
		else:
			return
	else:
		return
