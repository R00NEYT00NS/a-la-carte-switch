extends CharacterBody2D

var speed = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Our function for jumping so we don't have to repeat.
func jump():
	if Input.is_action_just_pressed("ui_accept"):
		#change gravity
		gravity = -gravity
		
		#change character rotation
		$".".scale.y = -$".".scale.y

func _physics_process(delta):
	
	# Add the gravity.
	velocity.y += gravity * delta
	# Add constant speed
	velocity.x = speed
	
	# Allows player to only jump when touching floor.
	if is_on_floor():
		jump()
		
	# Allows player to only jump when touching ceiling.		
	if is_on_ceiling():
		jump()
	
	move_and_slide()
