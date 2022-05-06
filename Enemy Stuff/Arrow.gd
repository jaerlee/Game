extends KinematicBody2D

export var Gravity = .3
export var Power = 30
var StartingPosition
var RelativeDistance
var InitialSlope
var Velocity
var PlayerPosition
onready var Player = get_node("/root/LevelTemplate/Player")
#onready var Arrow = get_parent().get_node("ArrowBody")


func _ready():
	StartingPosition = Vector2(get_global_position())
	PlayerPosition = Vector2(Player.get_global_position())
	RelativeDistance = PlayerPosition - StartingPosition
	InitialSlope = ((RelativeDistance.y-abs(RelativeDistance.x*Gravity/2))/RelativeDistance.x)#-(RelativeDistance.x*Gravity) #is the part being subtracted necessary? when Gravity == zero, the object moves towards the player (despite some weird negative number mistakes)
	Velocity = Vector2(cos(atan(InitialSlope)),sin(atan(InitialSlope))).normalized()*Power
	print(Velocity)
	print(InitialSlope)
##On Ready, we get the position of the player and arrow
##calculate the relative distance the arrow has to travel
##Find the initial slope for the arrow to be moving on
##take the arctangent to find the angle, then find the relative x and y velocities based on that angle


func _physics_process(_delta):
	move_and_collide(Velocity)
	Velocity.y += Gravity
#	pass
##this function creates a vector which has the correct initial slope
##next step would be to add gravity so that the arrow falls correctly
##if you are reading this, I got sidetracked making the test enemy shoot the arrow
#
#
