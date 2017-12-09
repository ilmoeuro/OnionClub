extends Node

export(NodePath) var target
export(float) var move_speed = 1.0

onready var target_node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)
	target_node = get_node(target)

func _fixed_process(delta):
	if Input.is_action_pressed("pc_left"):
		target_node.move(Vector2(-move_speed * delta, 0))
	
	if Input.is_action_pressed("pc_right"):
		target_node.move(Vector2(move_speed * delta, 0))
	