extends Actor
class_name FlyEnemy

var b
var c
var a
enum states {idle, see, attack, dead}
var state
onready var anim = $AnimationPlayer
export var death = false
var health = 50
export var attack = false
export var retreat = false
export var chill = false
var is_moving_left = false
#export var hit = false
#export var stun = false
var attackvel = Vector2(0,0)

func _ready():
	state = states.idle
	velocity.x = -speed.x
	get_node("Sprite").visible = true
	death = false
	get_node("CollisionShape2D").disabled = false
	#stun = false
	attack = false
	retreat = false
	chill = false

func _physics_process(delta):
	#velocity.y += gravity * delta
	if state == states.dead:
		anim.play("dead")
		if death == true:
			queue_free()
	else:
		if state == states.idle:
			if is_on_wall():
				velocity.x *= -1.0
				scale.x = -scale.x
			velocity.y = 0
			velocity.y = move_and_slide(velocity,FLOOR_NORMAL).y
		if state == states.see:
			delta = self.global_position - get_node("/root/LevelTemplate/Player").global_position
			#print(delta)
			#print(delta[0])
			a=int(delta[0])
			b=int(delta[1])
			#print(a)
			#print(b)
			#print(pow(a,2))
			#print(sqrt(pow(a,2)+pow(b,2)))
			#print(sqrt(pow(a,2)+pow(b,2)))
			#print(speed.x*(a/sqrt(pow(a,2)+pow(b,2))))
			velocity = Vector2(-speed.x*(a/sqrt(pow(a,2)+pow(b,2))), -speed.y*(b/sqrt(pow(a,2)+pow(b,2))))
			if sqrt(pow(a,2)+pow(b,2))<200:
				if not anim.is_playing():
#					print("hello")
					$AnimationPlayer.play("attack")
					attackvel = Vector2(-speed.x*(a/sqrt(pow(a,2)+pow(b,2))), -speed.y*(b/sqrt(pow(a,2)+pow(b,2))))
#			print("a", attack)
#			print("r", retreat)
			if attack == true:
				velocity = attackvel
			if retreat == true:
				velocity = -attackvel
			if chill == true:
				velocity = Vector2(0,0)
			if velocity.x>0:
				if is_moving_left==true:
					scale.x *= -1
					is_moving_left = false
			if velocity.x<0:
				if is_moving_left == false:
					scale.x *= -1
					is_moving_left = true
			#	velocity = velocity*-50
			#if stun == true:
			#	velocity = Vector2(0,0)
			
			velocity.y = move_and_slide(velocity,FLOOR_NORMAL).y
			#hit = false
func handle_hit():
	health = health - 25
	print(health)
	if health < 1:
		state = states.dead
	
func see_player():
	state = states.see

func seent_player():
	state = states.idle
	velocity.x = -speed.x

func _on_EnemyHitbox_body_entered(body):
	if body.has_method("handle_hit_player"):
		body.handle_hit_player()
		#anim.play("hit")
		#hit = true
