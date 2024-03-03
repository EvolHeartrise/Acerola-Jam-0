class_name CharacterController
extends CharacterBody3D

@export var movement_speed: float = 4

@onready var rotator: Node3D = %Rotator

enum State {
	IMMOBILE,
	WALKING,
	DRAWING_BOW,
}

var state: State = State.WALKING

@onready var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")

func _process(_delta: float) -> void:
	match state:
		State.IMMOBILE:
			velocity = Vector3.ZERO
		State.WALKING:
			if not is_on_floor():
				velocity.y = -gravity
			var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
			velocity.x = input_direction.x * movement_speed
			velocity.z = input_direction.y * movement_speed
			if input_direction:
				rotator.look_at(rotator.global_position + Vector3(input_direction.x, 0, input_direction.y))
			move_and_slide()
			if Input.is_action_just_pressed("select"):
				#TODO: Interaction logic
				pass
		State.DRAWING_BOW:
			var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
			if input_direction:
				rotator.look_at(rotator.global_position + Vector3(input_direction.x, 0, input_direction.y))
			if Input.is_action_just_released("use_bow"):
				state = State.IMMOBILE
				#TODO: Handle firing the bow
	
