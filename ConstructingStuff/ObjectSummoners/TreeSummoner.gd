extends Node2D

var tree_scene = preload("res://ConstructingStuff/Buildings/TallTrunk.tscn")
var EnemyOutpost = preload("res://ConstructingStuff/Buildings/TrunkWithOutpost.tscn")
var NewTree
onready var God = get_node("/root/LevelCreator")
#var TreeParts = [TreeScene,EnemyOutpost]
#var tree_scene = preload("res://ConstructingStuff/Buildings/TallTrunk.tscn")


func _ready():
	print(global_position, "Summoner")
	randomize()
	if randi()%4 < 3:
		NewTree = tree_scene.instance()
		if God.previous_tree_height > 1:
			NewTree.height = God.previous_tree_height -1 + randi()%5
		else:
			NewTree.height = God.previous_tree_height + randi()%2
		add_child(NewTree)
#		get_node("/root/LevelCreator").previous_tree_height = NewTree.height
	
	
	
