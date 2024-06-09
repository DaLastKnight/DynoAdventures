extends Node

@onready var score = 0
@onready var scorelabel = $Scorelabel
@onready var validScore = false
@onready var platform = $"../Exit_platform/Platform"
@onready var animation_player = $"../Exit_platform/Platform/AnimationPlayer"
@onready var animationPlayed = false
@onready var area_2d = $"../Exit_platform/Platform/Area2D"
@onready var coinplayer = $coinplayer

# Bug 1: When player attacks slime from right side, instead of being knocked back, slime moves towards the player
# Bug 2: When detecting and moving towards player, slimes seem to be able to float midair?
# Bug 3: deathsound plays when pressing play on the titlescreen (only meant to happen when falling off the level)


func add_point(point: int):
	coinplayer.play()
	score += point

# This function checks your score and eligibility and gives different descriptions based on your total score
func interact():
	if Input.is_action_just_pressed("interact"):
		if score >= 120:
			if score < 160:
				validScore = true
				scorelabel.set_text("You made it! Congratulations on getting a score of: " + str(score))
			elif score == 160:
				validScore = true
				scorelabel.set_text("Wow! You got all the coins :D")
		elif score < 120:
			if score > 0:
				scorelabel.set_text("You have not met the score requirement of 120. Come back later and press E again")
			elif score == 0:
				scorelabel.set_text("...How have you not gotten any coins?")
			
	if validScore: # The exit is shown when you hit the score requirement
		if animationPlayed == false:
			animation_player.play("new_animation")
			animationPlayed = true
		else:
			return


func reset():
		get_tree().reload_current_scene()

func quit():
	get_tree().quit()


func _on_area_2d_body_entered(body): # When the player lands on the exit platform, the game quits you out
	if body.name == "Player":
		get_tree().quit()
