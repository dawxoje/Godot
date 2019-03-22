extends RigidBody2D

var min_speed=150
var max_speed=250
var mob_types=["walk","swim","fly"]

func _ready():
	#Seleccion aletoria entre las animaciones
	$AnimatedSprite.animation=mob_types[randi()%mob_types.size()]
	

func _on_Visibility_screen_exited():
	queue_free()
