extends CharacterBody2D

var speed = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	
	# Add the gravity.
	velocity.y += gravity * delta
	# Add constant speed
	velocity.x = speed
		
	if Input.is_action_just_pressed("ui_accept"):
		#change gravity
		gravity = -gravity
		
		#change character rotation
		$".".scale.y = -$".".scale.y
	
	move_and_slide()
