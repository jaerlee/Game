extends TileMap

var distance = 1025
var Equiplacements = distance/3

func _ready():
	var Sponge = preload("res://src/Actors/Test Enemy.tscn")
	randomize()
	for n in 3:
		var enemy_to_instance = Sponge.instance()
		add_child(enemy_to_instance)
		enemy_to_instance.position.x = n*Equiplacements
