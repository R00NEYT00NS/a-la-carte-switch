extends CharacterBody2D

var speed = 100
var motion = Vector2()

func _physics_process(delta):
	
	motion.x = speed
	motion.y = speed 
	move_and_slide()
