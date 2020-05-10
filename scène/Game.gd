extends Node2D

onready var player = $Player
onready var player_white = $PlayerWihte
var is_entered = false
var other_entered = false

func _on_Coin_body_entered(body):
	if body == player:
		is_entered = true
	if body == player_white:
		other_entered = true
	if is_entered == true and other_entered == true:
		print("victory")


func _on_Area2D_body_entered(body):
	get_tree().quit()


func _on_Coin_body_exited(body):
	if body == player:
		is_entered = false
	if body == player_white:
		other_entered = false
