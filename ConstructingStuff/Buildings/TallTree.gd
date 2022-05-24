extends Area2D

export var height_change = Vector2()
var height
var TreeSprite = preload("res://ConstructingStuff/ForTree/TreeSprite.tscn")
var new_TreeSprite

func _ready():
	for n in height:
		new_TreeSprite = TreeSprite.instance()
		add_child(new_TreeSprite)
		new_TreeSprite.global_position = global_position + height_change*n
	global_position = get_parent().global_position
	print(global_position,"TreePosition")
	print(height,"TreeHeight")
	

