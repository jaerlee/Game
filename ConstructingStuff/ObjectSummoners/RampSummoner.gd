extends Node2D

var RampScene = preload("res://ConstructingStuff/Buildings/RampScene.tscn")
var NewRamp

func _ready():
	randomize()
	if randi()%4 < 3:
		NewRamp = RampScene.instance()
		get_parent().get_parent().call_deferred("add_child",NewRamp)
		NewRamp.global_position = self.global_position
