extends CharacterBody2D

#setting character speed
@export var speed = 100

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

#gives reference to the animated sprite node
@onready var animated_sprite : AnimatedSprite2D = $AnimatedSprite2D

#setting a animation lock so one doesn't start without the other finishing first
var animation_locked : bool = false

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
	update_animation()

func update_animation():
	if not animation_locked:
		if velocity.x != 0:
			animated_sprite.play("run")
		else:
			animated_sprite.play("idle")
