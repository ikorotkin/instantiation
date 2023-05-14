extends Node


# Member variables

@export var icon: Resource # Icon scene
# Alternatively:
# var icon: Resource = preload("res://icon.tscn")

var counter: int = 0 # Counts mouse button clicks


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Node Main is ready.") # Prints to console
	$Counter.text = "Icons: " + str(counter) # Initializes the label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass # Does nothing


# Called when the user interacts with the app
func _input(event):

	# Left mouse button click
	if event.is_action_pressed("click"):

		# Creates a new instance of icon.tscn
		var new_icon = icon.instantiate()
		new_icon.position = \
			get_viewport().get_mouse_position()
		add_child(new_icon)

		# Counts the clicks and updates the label
		counter += 1
		print("counter = ", counter)
		$Counter.text = "Icons: " + str(counter)
