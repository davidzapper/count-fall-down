extends CharacterBody2D

@onready var pas: AnimatedSprite2D = $PlayerAnimatedSprite
@onready var start_button: Button = $"../UI/StartScreen/StartButton"

const SPEED = 500.0
const JUMP_VELOCITY = -1000.0

@export var canmove = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor() and canmove == true:
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor() and canmove == true:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction and canmove == true:
		velocity.x = direction * SPEED
	elif canmove == true:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction == 1:
		pas.flip_h = false
	if direction == -1:
		pas.flip_h = true
	
	# Animation Changes
	if is_on_floor() == true:
		if velocity.x == 0:
			pas.play("idle")
		else:
			pas.play("run")
	if is_on_floor() == false:
		pas.play("jump")

	move_and_slide()
