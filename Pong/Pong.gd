extends Node2D

var screenSize
var padSize
const PAD_VELOCITY=150
var padPlayerOne=Rect2(get_node("PlayerOne").get_position() - padSize/2,padSize)
var padPlayerTwo=Rect2(get_node("PlayerTwo").get_position() - padSize/2,padSize)

var ball_position=get_node("Ball").get_position()#en el tuto era solo get_pos
var ball_velocity=80
var direction=Vector2(-1,0)


func _ready():
	screenSize=get_viewport_rect().size
	padSize=get_node("PlayerOne").get_texture().get_size()
	set_process(true)	

func _process(delta):
	ball_position+=direction*ball_velocity*delta