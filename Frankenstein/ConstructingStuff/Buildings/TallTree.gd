extends Area2D

export var height_change = Vector2()
var height
var TreeSprite = preload("res://ConstructingStuff/ForTree/TreeSprite.tscn")
var EnemySpot = preload("res://ConstructingStuff/Buildings/TrunkWithOutpost.tscn")
var new_Sprite
onready var HitBox = get_child(0)

func _ready():
	global_position = get_parent().global_position
	for n in (height-1):
		randomize()
		if randi()%5 == 4:
			new_Sprite = EnemySpot.instance()
		else:
			new_Sprite = TreeSprite.instance()
		add_child(new_Sprite)
		get_child(n+2).global_position = get_child(n+1).global_position + height_change*5
#		print(get_child(n+2).global_position, "SpriteHeight")
	HitBox.scale = Vector2(1,height)
	HitBox.translate((height-1) * height_change/2)
	
	
	

