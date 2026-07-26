extends Node2D

@onready var count: CanvasLayer = $"../../UI/Count"

@export var objects : Array[PackedScene]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func spawn():

	count.up_count()
	
	var scene = objects.pick_random()
	var obj = scene.instantiate()
	
	obj.position = Vector2(
		randf_range(50,670),
		-100
	)
	obj.rotation = randf_range(-3.14,3.14)
	obj.angular_velocity = randf_range(-5,5)


	get_parent().get_node("../Objects").add_child(obj)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_spawn_timer_timeout() -> void:
	spawn()
