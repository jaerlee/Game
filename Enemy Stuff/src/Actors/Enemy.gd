extends Actor
class_name Enemy

enum states {idle, see, attack, dead}
var state

func _ready():
	state = states.idle
	velocity.x = -speed.x



func _physics_process(delta):
	velocity.y += gravity * delta
	if state == states.idle:
		if is_on_wall():
			velocity.x *= -1.0
		velocity.y = move_and_slide(velocity,FLOOR_NORMAL).y
	if state == states.see and is_on_floor():
		velocity = Vector2(0,0)

func handle_hit():
	queue_free()

func see_player():
	state = states.see

func seent_player():
	state = states.idle
	velocity.x = -speed.x
