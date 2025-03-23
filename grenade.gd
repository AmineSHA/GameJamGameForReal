extends CharacterBody2D

@export var SPEED = 100
var dir: float 
var spawnPos: Vector2
var spawnRot: float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	global_position = spawnPos
	global_rotation = spawnRot	
	

func _physics_process(delta):
	velocity = Vector2(0,-SPEED).rotated(dir)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
