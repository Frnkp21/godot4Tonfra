extends KinematicBody2D

export var move_speed = 100  # Velocidad de movimiento en píxeles por segundo

onready var anim_tree = $AnimationTree
onready var anim_state = anim_tree.get("parameters/playback")
onready var animation_player = $AnimationPlayer  # Agregar el AnimationPlayer

var last_direction = Vector2(0, 0)  # Variable para realizar un seguimiento de la última dirección

func _physics_process(delta):
	var motion = Vector2(0, 0)

	if Input.is_action_pressed("move_right"):
		motion.x += 1
		last_direction = Vector2(1, 0)  # Actualizar la última dirección a la derecha
		$AnimationPlayer.play("Walk_right")
	elif Input.is_action_pressed("move_left"):
		motion.x -= 1
		last_direction = Vector2(-1, 0)  # Actualizar la última dirección a la izquierda
		$AnimationPlayer.play("Walk_left")
	elif Input.is_action_pressed("move_down"):
		motion.y += 1
		last_direction = Vector2(0, 1)  # Actualizar la última dirección hacia abajo
		$AnimationPlayer.play("Walk_down")
	elif Input.is_action_pressed("move_up"):
		motion.y -= 1
		last_direction = Vector2(0, -1)  # Actualizar la última dirección hacia arriba
		$AnimationPlayer.play("Walk_up")
	else:
		# Si no se está presionando ninguna tecla de movimiento, reproducir la animación de IDLE según la última dirección
		if last_direction == Vector2(-1, 0):
			$AnimationPlayer.play("Idle_left")
		elif last_direction == Vector2(1, 0):
			$AnimationPlayer.play("Idle_right")
		elif last_direction == Vector2(0, 1):
			$AnimationPlayer.play("Idle_down")
		elif last_direction == Vector2(0, -1):
			$AnimationPlayer.play("Idle_up")

	motion = motion.normalized() * move_speed * delta
	move_and_collide(motion)
