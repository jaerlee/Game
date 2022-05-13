extends KinematicBody2D

const SNAP_DIRECTION = Vector2.DOWN
const SNAP_LENGTH = 8.5
var snap_vector = SNAP_DIRECTION * SNAP_LENGTH
export var move_speed = Vector2(500,0)
export var gravity = 5000
export var jump_speed = Vector2(0,-1000)
export var air_res = 25
var floor_normal = Vector2(0,-1)
var movement_velocity


func _ready():
	movement_velocity = Vector2(0,0)

# warning-ignore:unused_argument
func _physics_process(delta):
	if is_on_floor():
		movement_velocity = Vector2(0,0)
	if !is_on_floor():
		movement_velocity.y += gravity * delta
	_move_left()
	_move_right()
	_move_jump()
	_move()

func _move_left():
	if Input.is_key_pressed(KEY_D):
			movement_velocity.x = move_speed.x
func _move_right():
	if Input.is_key_pressed(KEY_A):
			movement_velocity.x = -move_speed.x
func _move_jump():
	if Input.is_key_pressed(KEY_W) && is_on_floor():
		movement_velocity.y = jump_speed.y

func _move():
# warning-ignore:return_value_discarded
	move_and_slide_with_snap(movement_velocity, snap_vector,floor_normal,true)
#	move_and_slide(Vector2(0,movement_velocity.y),floor_normal,true)

