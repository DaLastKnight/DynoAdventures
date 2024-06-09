extends CharacterBody2D

# Figuring out the slime's mechanics took me some time as well!
# I put in some time and effort to figure out how the raycast2Ds can detect the player AND execute code 
@onready var slime_sprite = %slimeSprite
@onready var health = 100
@onready var timer = $Timer
@onready var detect_left = $detectLeft
@onready var detect_right = $detectRight
@onready var killzone = $Killzone
@onready var lives = 3
@onready var knockback_direction = 0
@onready var knockback_strength = 0
@onready var knockback_modifier = 0.005
@onready var knockback = 0
@onready var direction2 = 0
@onready var body = ""
@onready var playerhurt = $playerhurt
@onready var enemyhurt = $enemyhurt


const SPEED = 2000.0 # I have no clue why I need 2000.0 speed to even remotely move slowly



func _ready():
	slime_sprite.play("idle_attack")

func _physics_process(delta):
	var direction = 0
	
	# Movement is based on which side of the slime the player is positioned at
	if detect_left.is_colliding():
			direction = -1
			slime_sprite.flip_h = true
			velocity.x = direction * SPEED * delta
			
			move_and_slide()
	if detect_right.is_colliding():
			direction = 1
			slime_sprite.flip_h = false
			velocity.x = direction * SPEED * delta
			
			move_and_slide()
	
	

# The Hitbox.gd script helped to give the dmg amount and Hurtbox.gd script told slime to take_damage()
# I had a rough time ordering each line of code correctly so code doesn't execute in the wrong order
func take_damage(amount):
	slime_sprite.play("hurt")
	enemyhurt.play()
	health = health - amount
	timer.start(0.5)
	return health


func receive_knockback(damage_direction: Vector2, received_damage: int):
	knockback_direction = damage_direction.x
	
	if knockback_direction < 0:
		direction2 = -1
	elif knockback_direction > 0:
		direction2 = 1
	
	
	knockback_strength = received_damage * knockback_modifier
	knockback = knockback_direction * knockback_strength * direction2
	
	global_position.x += knockback
	
	
# After timer ends, checks whether the slime is above 0 hp
# For some reason, printing the health in either functions loops the print().
# I don't know if this is a Godot 4 thing though
func _on_timer_timeout():
	if health > 0:
		slime_sprite.play("idle_attack")
	if health <= 0:
			queue_free()
			return


func _on_killzone_body_entered(body): # For elif statement, the sound of player getting hurt delays the reset
	if body.name == "Player":
		if lives != 1:
			lives -= 1
			playerhurt.play()
		elif lives == 1:
			lives -= 1
			playerhurt.play()
			await playerhurt.finished
			get_tree().reload_current_scene()
