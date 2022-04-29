extends KinematicBody2D

var vel = Vector2()
var gravity = 10

func _physics_process(_delta):
		vel.y += gravity
		move_and_slide(Vector2(0,vel.y),Vector2(0,-1))
		if Input.is_key_pressed(KEY_D):
			move_and_slide(Vector2(350,0), Vector2(0,-1))
		if Input.is_key_pressed(KEY_A):
			move_and_slide(Vector2(-350,0),Vector2(0,-1))
		if Input.is_key_pressed(KEY_SPACE) && is_on_floor():
			vel.y = -500
