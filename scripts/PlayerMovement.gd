extends CharacterBody2D


const SPEED = 13500.0
const PROJ_SPEED = 10.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D
@onready var player_projectile = $PlayerProjectile


func _physics_process(delta):
	# Add the gravity.

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionH = Input.get_axis("MoveLeft", "MoveRight") #-1 -> jobb, 0 -> idle, 1 -> bal
	var directionV = Input.get_axis("MoveUp","MoveDown") #-1 -> fel, 0 -> idle, 1 -> le
	
	if directionH == 0 && directionV == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	
	if directionH > 0:
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true
	
	if directionH:
		velocity.x = directionH * SPEED * delta
	else:
		velocity.x = directionH * SPEED * delta
	if directionV:
		velocity.y = directionV * SPEED * delta
	else:
		velocity.y = directionV * SPEED * delta
		
	if Input.is_action_pressed("Shoot"):
		player_projectile.show()
		if directionH == 0 && directionV == 0:
			
		
	
	move_and_slide()
