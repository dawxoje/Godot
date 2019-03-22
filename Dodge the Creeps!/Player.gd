extends Area2D
signal hit

var speed=400
var screensize

func _ready():
	
	screensize=get_viewport_rect().size
	set_process(true)

func start(pos):
	position=pos
	show()
	$CollisionShape2D.disabled=false

func _process(delta):
	var velocity=Vector2()
	#direcciones
	if Input.is_action_pressed("ui_right"):
		velocity.x+=1
	if Input.is_action_pressed("ui_left"):
		velocity.x-=1
	if Input.is_action_pressed("ui_down"):
		velocity.y+=1
	if Input.is_action_pressed("ui_up"):
		velocity.y-=1
	#moverse o no y normalizacion de vectores
	if velocity.length()>0:
		velocity=velocity.normalized()*speed

		$AnimatedSprite.play()
	else:
		$AnimatedSprite.stop()
	#actualizando posicion
	position+=velocity*delta
	#limitando el area del jugador
	var halfSprite=30	#para que no se salga ni la mitad
	position.x=clamp(position.x,halfSprite,screensize.x-halfSprite)
	position.y=clamp(position.y,halfSprite,screensize.y-halfSprite)
	#configurando animacion
	if velocity.x!=0:
		$AnimatedSprite.animation="right"
		#$AnimatedSprite.flip_v=false #Me mola mas sin esto
		$AnimatedSprite.flip_h=velocity.x<0
	elif velocity.y!=0:
		$AnimatedSprite.animation="up"
		$AnimatedSprite.flip_v=velocity.y>0

func _on_Player_body_entered(body):
	hide()
	emit_signal("hit")
	$CollisionShape2D.disabled=true #Para no disparar la señar hit todo el rato
