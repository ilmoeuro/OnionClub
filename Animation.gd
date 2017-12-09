extends AnimatedSprite

export(String) var priorities = ""
onready var priorities_list

func _ready():
	priorities_list = priorities.split(",")