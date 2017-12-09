extends Node

export(NodePath) var target
export(NodePath) var floor_sensor
export(NodePath) var animation
export(float) var jump_speed = 60
export(float) var fall_speed = 20.0

onready var target_node
onready var sensor_node
onready var animation_node
var jumped = false
var velocity = 0

func _ready():
	set_fixed_process(true)
	target_node = get_node(target)
	sensor_node = get_node(floor_sensor)
	animation_node = get_node(animation)

func _on_ground():
	return not sensor_node.get_overlapping_bodies().empty() 

func _fixed_process(delta):
	if Input.is_action_pressed("pc_up") and not jumped and _on_ground():
		velocity = -jump_speed
		jumped = true
	
	if not _on_ground():
		jumped = false
	
	if velocity < 0 and animation_node.get_animation() != "jump":
		animation_node.set_animation("jump")
	
	velocity += fall_speed*delta
	target_node.move(Vector2(0, velocity*delta))
	
	if _on_ground() and target_node.is_colliding():
		velocity = 0
	
	delta = yield()
