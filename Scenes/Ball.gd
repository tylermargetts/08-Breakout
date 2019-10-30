extends RigidBody2D

func _ready():
    contact_monitor = true
    set_max_contacts_reported(4)

func _physics_process(delta):
    var bodies = get_colliding_bodies()
    for body in bodies:
        if body.is_in_group("Tiles"):
            body.queue_free()

func _update():
	var lives = 3
	var points = 0
	$LabelLives.set_text(lives)
	$LabelPoints.set_text(points)
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("Tiles"):
			points += 1
	if position.y > get_viewport_rect().end.y:
		print("Died")
		lives -= 1
		position.y = 480
		position.x = 512

		