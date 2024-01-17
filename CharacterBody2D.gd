extends CharacterBody2D


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var speed = 100
var motion = Vector2

func _physics_process(delta):
	# Add the gravity.
	velocity.y += gravity * delta
	velocity.x += speed

	# Handle Jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = gravity * -1

	move_and_slide()
