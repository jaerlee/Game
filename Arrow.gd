extends KinematicBody2D

export var Gravity = .3
export var Power = 600
var StartingPosition
var RelativeDistance
var InitialSlope
var Velocity = Vector2(0,0)
var PlayerPosition
var a
var b
var c
var Squared_x_over_X_Velocity
var Integerized
onready var Player = get_node("/root/LevelCreator/Player")
#onready var Arrow = get_parent().get_node("ArrowBody")

#
func _ready():
	StartingPosition = Vector2(get_global_position())
	PlayerPosition = Vector2(Player.get_global_position())
	RelativeDistance = PlayerPosition - StartingPosition
	b = (RelativeDistance.y*Gravity - pow(Power,2))
	a = pow(Gravity/2,2)
	c = (pow(RelativeDistance.y,2) + pow(RelativeDistance.x,2))
	print("a:",a)
	print("b:",b)
	print("c:",c)
	Integerized = int((pow(b,2)-4*(a)*(c)))
	Squared_x_over_X_Velocity = (-b - sqrt(Integerized))/(2*a)
	print("Squared:",Squared_x_over_X_Velocity)
	print("numerator:",pow(b,2)-4*(a)*(c))
	Velocity.x = RelativeDistance.x/sqrt(Squared_x_over_X_Velocity)
	Velocity.y = sqrt(pow(Power,2)-pow(Velocity.x,2))
	print(Velocity)
	if RelativeDistance.y < 0:
		Velocity.y *= -1
##On Ready, we get the position of the player and arrow
##calculate the relative distance the arrow has to travel
##Find the initial slope for the arrow to be moving on
##take the arctangent to find the angle, then find the relative x and y velocities based on that angle
#

func _physics_process(_delta):
	move_and_collide(Velocity)
	Velocity.y += Gravity

##this function creates a vector which has the correct initial slope
##next step would be to add gravity so that the arrow falls correctly
##if you are reading this, I got sidetracked making the test enemy shoot the arrow
#
#
