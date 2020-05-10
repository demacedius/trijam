extends KinematicBody2D

const SPEED = 200
const GRAVITY = 3600
const UP = Vector2(0,-1)
const JUMP_SPEED = -1050
var player = Player

var motion = Vector2()

func _ready():
	$Timer.start()
	_on_Timer_timeout()

func fall(delta):
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta


func _physics_process(delta):
	fall(delta)
	move_and_slide(motion, UP)


func _on_Timer_timeout():
	if motion.x <= 1:
		motion.x = SPEED
		$Sprite.flip_h = true
	else:
		motion.x = -SPEED
		$Sprite.flip_h = false



func _on_hitbox_body_entered(body):
	if body is Player:
		get_tree().change_scene("res://scène/Game_Over.tscn")


func _on_hurtBox_body_exited(body):
	if body is Player:
		queue_free()
