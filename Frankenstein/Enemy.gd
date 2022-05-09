extends KinematicBody2D

const SNAP_DIRECTION = Vector2.DOWN
const SNAP_LENGTH = 8.0
var snap_vector = SNAP_DIRECTION * SNAP_LENGTH
export var move_speed = Vector2(500,0)
export var gravity = 5000
var floor_normal = Vector2(0,-1)
var movement_velocity
var health_points

func _ready():
	movement_velocity = Vector2(0,0)
	health_points = 100

func _physics_process(delta):
		movement_velocity.y += gravity * delta
		_move()

func _move():
# warning-ignore:return_value_discarded
	move_and_slide_with_snap(movement_velocity, snap_vector,floor_normal,true)




func _on_AttackSpike_body_entered(body):
	queue_free()
