extends Actor
class_name Enemy

enum states {idle, see, attack, dead}
var state
var is_moving_left = true
var oldv = Vector2(0,0)
var deltas
var health = 100
var hit = false
onready var anim = $AnimationPlayer
export var death = false
export var stun = false


func _ready():
	state = states.idle
	velocity.x = -speed.x
	get_node("Sprite").visible = true
	death = false
	stun = false
	get_node("CollisionShape2D").disabled = false
	#scale.x*=-1

func _physics_process(delta):
	if state == states.dead:
		anim.play("dead")
		if death == true:
			queue_free()
	else:
#		print(scale.x)
		velocity.y += gravity * delta
		detect_turn_around()
		if state == states.idle:
			if is_on_wall():
				is_moving_left = !is_moving_left
#				scale.x = -scale.x
				velocity.x *= -1
			velocity.y = move_and_slide(velocity,FLOOR_NORMAL).y
		if state == states.see:
			deltas = self.global_position.x - get_node("/root/LevelTemplate/Player").global_position.x
			#print(delta)
			if deltas < -10:
				velocity.x = speed.x
			#	if hit == true:
			#		velocity.x = -speed.x*50
			elif deltas > 10:
				velocity.x = -speed.x
			else:
				velocity.x = 0
			if velocity.x>0:
				if is_moving_left==true:
					scale.x *= -1
					is_moving_left = false
			if velocity.x<0:
				if is_moving_left == false:
					scale.x *= -1
					is_moving_left = true
			
			#print(scale.x)
			#	if hit == true:
			#		velocity.x = speed.x*50
			#print(velocity.x)\
			#if stun == true:
			#	velocity.x = 0
			velocity.y = move_and_slide(velocity,FLOOR_NORMAL).y
			#hit = false


func detect_turn_around():
	if not $RayCast2D.is_colliding() and is_on_floor():
		#print($RayCast2D.is_colliding())
#		is_moving_left = !is_moving_left
#		scale.x = -scale.x
		velocity.x *= -1
		
func handle_hit():
	health = health - 25
	print(health)
	if health < 1:
		state = states.dead
		

func see_player():
	state = states.see
	#print(hit)
	#pass
	#print(get_node("/root/LevelTemplate/Player").global_position)
	
	
	#state = states.see

func seent_player():
	state = states.idle



func _on_EnemyHitbox_body_entered(body):
	pass
	#if body.has_method("handle_hit_player"):
		#body.handle_hit_player()
		#anim.play("hit")
		#hit = true


func _on_PlayerDetector_body_entered(body):
	$AttackPlayer.play("Attack")


func _on_AttackDetector_body_entered(body):
	if body.has_method("handle_hit_player"):
		body.handle_hit_player()
