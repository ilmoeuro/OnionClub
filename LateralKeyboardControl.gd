extends Node

export(NodePath) var target
export(NodePath) var animation
export(NodePath) var floor_sensor
export(float) var move_speed = 1.0

onready var target_node
onready var animation_node
onready var sensor_node

func _ready():
	set_fixed_process(true)
	target_node = get_node(target)
	animation_node = get_node(animation)
	sensor_node = get_node(floor_sensor)

func _on_ground():
	return not sensor_node.get_overlapping_bodies().empty() 

func _fixed_process(delta):
	if Input.is_action_pressed("pc_left"):
		target_node.move(Vector2(-move_speed * delta, 0))
		if _on_ground():
			animation_node.set_animation("walk")
		animation_node.set_flip_h(false)
	elif Input.is_action_pressed("pc_right"):
		target_node.move(Vector2(move_speed * delta, 0))
		if _on_ground():
			animation_node.set_animation("walk")
		animation_node.set_flip_h(true)
	elif _on_ground():
		animation_node.set_animation("default")
	