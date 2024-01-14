extends CharacterBody2D

@export var speed = 400

var move = 100
var fall = 100

func _physics_process(delta):
	
	velocity.x = move
	velocity.y = fall
	move_and_slide()
	

