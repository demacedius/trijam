class Player:
	extends KinematicBody2D

	var speed = 200
	var velocity = Vector2()
	var jump_force = -6000
	const GRAVITY = 100
	const FLOOR = Vector2(0,-1)
	var on_ground = false
	
	func _physics_process(delta):
		velocity = Vector2()
		if Input.is_action_pressed("droite"):
			velocity.x += 1
		if Input.is_action_pressed("gauche"):
			velocity.x -= 1
		else:
			velocity.x = 0
		velocity = velocity.normalized() * speed
		
		if Input.is_action_just_pressed("haut"):
			if is_on_floor():
				on_ground = true
				velocity.y = jump_force
				on_ground = false
		
			
		velocity.y += GRAVITY 
		
		velocity = move_and_slide(velocity, FLOOR)
	
	func _on_Area2D_body_entered(body):
		get_tree().quit()
