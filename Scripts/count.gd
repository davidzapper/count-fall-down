extends CanvasLayer

@onready var count_label: Label = $"Count Label"

const prefix_count = "Count: "

var obj_amount = 0

## Called when the node enters the scene tree for the first time.
func _ready() -> void:
	count_label.text = prefix_count + str(obj_amount)
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func up_count():
	obj_amount += 1
	count_label.text = prefix_count + str(obj_amount)

func reset():
	obj_amount = 0
	count_label.text = prefix_count + str(obj_amount)
