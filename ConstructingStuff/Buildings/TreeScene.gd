extends Node2D

var height
var tree_scene = preload("res://ConstructingStuff/Buildings/TallTrunk.tscn")
var enemy
var NewTrunk

func _ready():
	print(global_position, "TreeScene")
	print(height,"TS_height")
	NewTrunk = tree_scene.instance()
#	NewTrunk.height = height
#	NewTrunk.global_position = get_node("/root/Forest/TreeSummoner").global_position
	get_parent().add_child(NewTrunk)
#		Summon new sprite for the height, add the distance that they need to be summoned at
