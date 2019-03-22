extends Node

var Mob=preload("res://Mob.gd")
var score

func _ready():
	randomize()

func game_over():
	$ScoreTimer.stop()
	$MobTimer.stop()
	
	$HUD.show_game_over()

func new_game():
	score=0
	$Player.start($StartPosition)
	$StartTimer.start()
	
	$HUD.update_score(score)
	$HUD.show_message("Get Ready")

func _on_StartTimer_timeout():
	$ScoreTimer.start()
	$MobTimer.start()

func _on_ScoreTimer_timeout():
	score+=1
	$HUD.update_score(score)

func _on_MobTimer_timeout():
	#Punto de salida
	$MobPath/MobSpawnLocation.set_offset(randi())
	
	var mob=Mob.instance()
	add_child(mob)
	#Angulo de salida perpendicular
	var direction=$MobPath/MobSpawnLocation.rotation + PI / 2
	#Esta no lo pillo del todo
	mob.position=$MobPath/MobSpawnLocation.position
	#Ruta aleatoria
	direction+=rand_range(-PI/4,PI/4)
	mob.rotation=direction
	#Vaya fumada matematica
	mob.set_linear_velocity(Vector2(rand_range(mob.min_speed, mob.max_speed),0).rotated(direction))