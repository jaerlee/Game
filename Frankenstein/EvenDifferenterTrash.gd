extends Node2D

const map_length = 10
var land_to_instance
var previous_end = Vector2(0,0)
var map_numbers = []
var tile_dimensions = [Vector2(1025,0),Vector2(1025,0),Vector2(1025,0),Vector2(1025,0)]
var origin_change = Vector2(0,0)

#previous_end_height += if I want to make the height change, I can 
#		give each tile map a specific heigh that it changes the y value by.
#		Then, by summing up the changes, I could always set the maps to line up

func _ready():
	var simple_hill = preload("res://TileScenes/SimpleHill.tscn")
	var big_hill = preload("res://TileScenes/BigHill.tscn")
	var valley = preload("res://TileScenes/Valley.tscn")
	var flat_land = preload("res://TileScenes/FlatLand.tscn")
	var land_array = [simple_hill,big_hill,valley,flat_land]
	randomize()
	for n in map_length:
		map_numbers.append(randi()%4)
		land_to_instance = land_array[map_numbers[n]].instance()
		add_child(land_to_instance)
		land_to_instance.position = Vector2(previous_end)
		previous_end += tile_dimensions[map_numbers[n]]
