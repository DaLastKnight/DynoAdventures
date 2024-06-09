extends CharacterBody2D

# Some nodes that I reference to
@onready var p_sprite = $pSprite
@onready var p_shape = $pShape
@onready var dashtimer = $dashtimer
@onready var dashagaintimer = $dashagaintimer
@onready var jumpsound = $jumpsound


const SPEED = 100.0
const JUMP_VELOCITY = -250.0
const DASHSPEED = 250.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var health = 100
var dashing= false # By default, player is not dashing when game starts
var candash = true # By default, player is able to dash when game starts
var body = CharacterBody2D.new()	


func _on_dashtimer_timeout():
	dashing = false # When time's up, player loses the "dashing" state

func _on_dashagaintimer_timeout():
	candash = true # When time's up, player is able to dash again


func _ready():
	p_sprite.play("idle") # Default animation

func _physics_process(delta): # Pretty sure delta is amount of time between each frame
	# Get direction
	var direction = Input.get_axis("move_left", "move_right") # -1,0,1
	
	if Input.is_action_just_pressed("reset"):
		var game_manager = get_parent().get_node("Game_manager") # Finds the node Game_manager
		
		if game_manager:
			game_manager.reset() # Will call a command from game_manager when it is true that game_manager is found
	
	if Input.is_action_just_pressed("quit"):
		var game_manager = get_parent().get_node("Game_manager")
		
		if game_manager:
			game_manager.quit()
			
	if Input.is_action_just_pressed("interact"):
		var game_manager = get_parent().get_node("Game_manager")
		
		if game_manager:
			game_manager.interact()
	
	# Add the gravity.
	if not is_on_floor():
		p_sprite.play("jump")
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		jumpsound.play()
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("dash") and candash:
		dashing = true # When player presses "dash" key, the "dashing" state becomes true
		candash = false # Player can't spam the key "dash" so there is a cooldown
		dashtimer.start(0.5) # Duration of "dash" state
		dashagaintimer.start(0.8) # Duration of cooldown
	
	# Code below determines which way player is facing
	if direction < 0:
		p_sprite.flip_h = true
	elif direction > 0:
		p_sprite.flip_h = false
		
	# Code below determines the animation playing in the given state
	if direction == 0:
		p_sprite.play("idle")
	else:
		p_sprite.play("run")
	
	if direction:
		if dashing:
			velocity.x = direction * DASHSPEED # When player is in the "dashing" state, the speed they move at increases for a short duration, giving the feeling of dashing
		else:
			velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()



