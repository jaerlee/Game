extends Node2D

var fly_scene = preload("res://src/Actors/FlyEnemy.tscn")
var NewEnemy


func _ready():
	NewEnemy = fly_scene.instance()
	add_child(NewEnemy)

