extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	_move()

func _move():
	if Input.is_key_pressed(KEY_D):
		move_and_slide(Vector2(100,0), Vector2(0,-1), true)
