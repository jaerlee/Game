extends Node2D

const map_length = 20
var land_to_instance
var previous_end = Vector2(0,0)
var map_numbers = []
var origin_change = Vector2(0,0)
var previous_tree_height = 1

#previous_end_height += if I want to make the height change, I can 
#		give each tile map a specific heigh that it changes the y value by.
#		Then, by summing up the changes, I could always set the maps to line up

func _ready():
	var fort = preload("res://ConstructingStuff/NewTiles/Fort.tscn")
	var forest = preload("res://ConstructingStuff/NewTiles/Forest.tscn")
	var reinforest = preload("res://ConstructingStuff/NewTiles/Re-in-Forest.tscn")
	var land_array = [forest,fort,reinforest]
	#preload each scene, pack into an array
	
	randomize() #why does randomize not need to be called inside the for loop?
	for n in map_length:
		map_numbers.append(randi()%3)
		land_to_instance = land_array[map_numbers[n]].instance()
		land_to_instance.position = Vector2(previous_end)
		add_child(land_to_instance)
		previous_end += 40*(land_to_instance.PositionChange + Vector2(1,0))
