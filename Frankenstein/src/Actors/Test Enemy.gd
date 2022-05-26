extends Enemy

var arrow = load("res://src/Actors/Arrow.tscn")
#var arrow_instance = arrow.instance() #see comment in method
var new_arrow


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.scancode == KEY_SPACE:
			shoot_arrow()

func shoot_arrow():
	new_arrow = arrow.instance() #need to instantiate in the function, not in the variables section. Otherwise, only one instance appears
	add_collision_exception_with(new_arrow)
	new_arrow.add_collision_exception_with(new_arrow)
	new_arrow.position = global_position
	get_tree().get_root().add_child(new_arrow)

	
