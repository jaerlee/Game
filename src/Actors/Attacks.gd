extends Area2D

onready var anim = $AnimationPlayer
export var mida = false
export var higha = false
export var highcancel = false
export var lowa = false
export var backa = false

func _ready():
	mida = false
	lowa = false
	highcancel = false
	higha = false
	backa = false
	get_node("Mid").disabled = true
	get_node("High").disabled = true
	get_node("Low").disabled = true
	get_node("Back").disabled = true

func midattack():
	if not $AnimationPlayer.is_playing():
		anim.play("mid_attack")

func lowattack():
	if not $AnimationPlayer.is_playing():
		anim.play("low_attack")
	
func highattack():
	if not $AnimationPlayer.is_playing():
		anim.play("high_attack")
	
func backattack():
	if not $AnimationPlayer.is_playing():
		anim.play("back_attack")
	
func _on_Attacks_body_entered(body):
	if body.has_method("handle_hit"):
		body.handle_hit()

func midaerial():
	if not $AnimationPlayer.is_playing():
		anim.play("mid_aerial")

func highaerial():
	if not $AnimationPlayer.is_playing():
		anim.play("high_aerial")

func lowaerial():
	if not $AnimationPlayer.is_playing():
		anim.play("low_aerial")

func backaerial():
	if not $AnimationPlayer.is_playing():
		anim.play("back_aerial")
