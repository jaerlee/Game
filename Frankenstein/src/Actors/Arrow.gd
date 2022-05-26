extends KinematicBody2D

export var Gravity = .3
export var Power = 70
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


func _ready():
	StartingPosition = Vector2(get_global_position())
	PlayerPosition = Vector2(Player.get_global_position())
	RelativeDistance = PlayerPosition - StartingPosition
	#Get the relative position of the Player, as if the Enemy always existed at (0,0)
	b = (RelativeDistance.y*Gravity - pow(Power,2))
	a = pow(Gravity/2,2)
	c = (pow(RelativeDistance.y,2) + pow(RelativeDistance.x,2))
	print("a:",a)
	print("b:",b)
	print("c:",c)
	Integerized = int((pow(b,2)-4*(a)*(c)))
	#overflow error occurs if not put into an integer
	Squared_x_over_X_Velocity = ((-b - sqrt(Integerized))/(2*a))
	print("Squared:",Squared_x_over_X_Velocity)
	print("numerator:",pow(b,2)-4*(a)*(c))
	Velocity.x = RelativeDistance.x/sqrt(Squared_x_over_X_Velocity)
	Velocity.y = sqrt(pow(Power,2)-pow(Velocity.x,2))
	print(Velocity)
	if RelativeDistance.y <= 0:
		Velocity.y *= -1
	#solved the equation as a parametric, y = y0 + Vy(t) + a(t^2) and x = x0 + Vx(t)
	#next, rearranged to get a parabola in terms of (x/v)^2. 
	#used the quadratic formula to solve for (x/v)^2
	#took the square root of both sides, then solved for v
	


func _physics_process(_delta):
	move_and_collide(Velocity)
	Velocity.y += Gravity

#Simple movement, repeatedly increasing(decreasing) the y-component by Gravity
