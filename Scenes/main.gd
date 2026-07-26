extends Node2D

@export var spawnTimer : Timer
@export var startScreen : Node2D
@export var counter : CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	counter.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func start() -> void:
	startScreen.visible = false
	counter.visible = true
	spawnTimer.start()
	counter.reset()
	#get_node()


func _on_start_button_pressed() -> void:
	start()
