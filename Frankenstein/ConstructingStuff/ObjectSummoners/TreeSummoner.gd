extends Node2D

var tree_scene = preload("res://ConstructingStuff/Buildings/TallTrunk.tscn")
var NewTree
onready var God = get_node("/root/LevelCreator")
#var TreeParts = [TreeScene,EnemyOutpost]
#var tree_scene = preload("res://ConstructingStuff/Buildings/TallTrunk.tscn")


func _ready():
	
	randomize()
	if randi()%6 >= 1:
		randomize()
		NewTree = tree_scene.instance()
		NewTree.height = God.previous_tree_height + randi()%3 - 1
		
		if NewTree.height < 1:
			NewTree.height = 1
		God.previous_tree_height = NewTree.height
		#don't want to run into trees with negative heights. Also, want the trees to trend upwards
		
		add_child(NewTree)
	
	elif God.previous_tree_height > 1:
		God.previous_tree_height -= 1
#		get_node("/root/LevelCreator").previous_tree_height = NewTree.height
	
	
	
