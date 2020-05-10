extends KinematicBody2D
class_name Player

export var speed = 200
const GRAVITY = 3500
const UP = Vector2(0,-1)
const JUMP_SPEED = -1050

var motion = Vector2()

func _physics_process(delta):
	fall(delta)
	run()
	jump()
	move_and_slide(motion, UP)


func fall(delta):
	if is_on_floor():
		motion.y = 0
	else:
		motion.y += GRAVITY * delta


func run():
	if Input.is_action_pressed("droite") and not Input.is_action_pressed("gauche"):
		motion.x = speed
	elif Input.is_action_pressed("gauche") and not Input.is_action_pressed("droite"):
		motion.x = -speed
	else:
		motion.x = 0


func jump():
	if is_on_floor() and Input.is_action_pressed("haut"):
		motion.y = JUMP_SPEED
