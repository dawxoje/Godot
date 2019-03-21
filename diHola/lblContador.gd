extends Label

var acum=0

func _ready():
	set_process(true)

func _process(delta):
	acum+=delta
	set_text(text+"=>"+str(acum))
	print(text)