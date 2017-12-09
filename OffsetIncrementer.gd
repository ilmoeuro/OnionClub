extends PathFollow2D

export(float) var speed = 1.0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	set_offset(get_offset() + delta * speed)