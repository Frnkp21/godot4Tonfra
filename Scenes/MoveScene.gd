extends Area2D

export (String) var escena

func _input(event):
	# Verificar si el evento es de tipo KEY y si la tecla es la que deseas
	if event is InputEventKey and event.pressed and event.scancode == KEY_E:
		cambiar_escena()

func cambiar_escena():
	# Cambiar la escena solo si el cuerpo del jugador está en el área
	var bodies = get_overlapping_bodies()
	for body in bodies:
		if body.name == "player":
			get_tree().change_scene("res://Scenes/" + escena + ".tscn")
			return  # Evitar cambiar la escena múltiples veces si hay varios cuerpos solapados

