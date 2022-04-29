extends KinematicBody2D
export var move_speed = Vector2(350,0)
export var gravity = 5000
export var jump_speed = Vector2(0,-1000)
export var air_res = 25
var floor_normal = Vector2(0,-1)
var movement_velocity
var max_walkable_slope = -0.3


func _ready():
	movement_velocity = Vector2(0,0)

func _physics_process(delta):
	if is_on_floor():
		movement_velocity.x = 0
	if !is_on_floor():
		movement_velocity.y += gravity * delta
	_move_left()
	_move_right()
	_move_jump()
	_move()

func _move_left():
	if Input.is_key_pressed(KEY_D):
		if is_on_floor():
			movement_velocity = movement_velocity + move_speed
func _move_right():
	if Input.is_key_pressed(KEY_A):
		if is_on_floor():
			movement_velocity = movement_velocity - move_speed
func _move_jump():
	if Input.is_key_pressed(KEY_W) && is_on_floor():
		movement_velocity.y = jump_speed.y

func _move():
	move_and_slide(Vector2(movement_velocity.x,movement_velocity.y), floor_normal,true)

func _slide():
	if is_colliding():
		if get_collision_normal().y > max_walkable_slope:
			movement_velocity.y = get_collision_normal().x * gravity * delta

