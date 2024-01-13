extends CharacterBody2D

@export var speed = 400

var move = 100

func _physics_process(delta):
	
	velocity.x = move
	move_and_slide()
