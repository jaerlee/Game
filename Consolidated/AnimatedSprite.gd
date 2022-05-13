extends AnimatedSprite

func _input(_event):
	if Input.is_key_pressed(KEY_D):
		set_flip_h(false)
		playing = true
	if Input.is_key_pressed(KEY_A):
		set_flip_h(true)
		playing = true
	if Input.is_key_pressed(KEY_SPACE):
		visible = false
	else:
		visible = true
		playing = false
		frame = 2
