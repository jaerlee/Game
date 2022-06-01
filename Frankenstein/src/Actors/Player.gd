extends Actor

#var direction: = Vector2.ZERO
#var SNAP_LENGTH = Vector2.DOWN*8.5
onready var weapon = $Attacks
#
func _unhandled_input(event):
	if event.is_action_pressed("mid_attack"):
		weapon.midattack()
	if event.is_action_pressed("low_attack"):
		weapon.lowattack()
	if event.is_action_pressed("high_attack"):
		weapon.highattack()
	if event.is_action_pressed("back_attack"):
		weapon.backattack()
const SNAP_DIRECTION = Vector2.DOWN
const SNAP_LENGTH = 8.5
var snap_vector = SNAP_DIRECTION * SNAP_LENGTH
export var move_speed = Vector2(800,0)
#export var gravity = 5000
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
	if Input.is_key_pressed(KEY_W):# && is_on_floor():
		movement_velocity.y = jump_speed.y

func _move():
# warning-ignore:return_value_discarded
	move_and_slide_with_snap(movement_velocity, snap_vector,floor_normal,true)

#func _physics_process(_delta):
#	var is_jump_interrupted: = Input.is_action_just_released("jump") and velocity.y < 0.0
#	direction = get_direction()
#	velocity = calculate_move_velocity(velocity, direction, speed, is_jump_interrupted)
#	velocity = move_and_slide_with_snap(velocity, SNAP_LENGTH,FLOOR_NORMAL, false)
#
#func get_direction() -> Vector2:
#	return Vector2(
#		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
#		-1.0 if Input.is_action_just_pressed("jump") and is_on_floor() else 1.0
#	)
#func calculate_move_velocity(
#	linear_velocity: Vector2,
#	direction: Vector2,
#	speed: Vector2,
#	is_jump_interrupted: bool
#	) -> Vector2:
#	var new_velocity: = linear_velocity
#	new_velocity.x = speed.x * direction.x
#	new_velocity.y += gravity * get_physics_process_delta_time()
#	if direction.y == -1.0:
#		new_velocity.y = speed.y * direction.y
#	if is_jump_interrupted:
#		new_velocity.y = 0.0
#	return new_velocity



