extends Node2D

var Torso = get_child(0)


func _shoot():
	get_child(0).get_child(0).visible = false
	get_child(0).get_child(1).visible = true
	
