extends Node2D

var enemy_scene =  preload("res://src/Actors/Enemy.tscn")
var NewEnemy


func _ready():
	NewEnemy = enemy_scene.instance()
	add_child(NewEnemy)
