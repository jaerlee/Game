extends Area2D


func _input(_event):
	if Input.is_key_pressed(KEY_SPACE):
		monitorable = true
	if !Input.is_key_pressed(KEY_SPACE):
		monitorable = false

