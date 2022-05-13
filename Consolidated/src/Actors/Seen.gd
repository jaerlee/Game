extends Area2D




func _on_Seen_body_entered(body):
	if body.has_method("see_player"):
		body.see_player()


func _on_Seen_body_exited(body):
	if body.has_method("seent_player"):
		body.seent_player()
