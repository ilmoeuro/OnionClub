extends Node

export(NodePath) var target
export(NodePath) var animation
export(float) var move_speed = 1.0

onready var target_node
onready var animation_node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)
	target_node = get_node(target)
	animation_node = get_node(animation)

func _fixed_process(delta):
	if Input.is_action_pressed("pc_left"):
		target_node.move(Vector2(-move_speed * delta, 0))
		animation_node.set_animation("walk")
		animation_node.set_flip_h(false)
	elif Input.is_action_pressed("pc_right"):
		target_node.move(Vector2(move_speed * delta, 0))
		animation_node.set_animation("walk")
		animation_node.set_flip_h(true)
	else:
		animation_node.set_animation("default")
	