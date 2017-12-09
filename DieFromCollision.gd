extends Node

export(NodePath) var death_sensor

onready var sensor_node

func _ready():
	set_fixed_process(true)
	sensor_node = get_node(death_sensor)

func _fixed_process(delta):
	if not sensor_node.get_overlapping_bodies().empty():
		get_tree().change_scene("res://GameOver.tscn")