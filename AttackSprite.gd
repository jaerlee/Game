extends Sprite

func _ready():
	visible = false

func _input(_event):
		if Input.is_key_pressed(KEY_SPACE):
			visible = true
		else:
			visible = false


