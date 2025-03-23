extends Node2D

@onready var main = get_tree().get_root()
@onready var projectile = load("res://scenes/grenade.tscn")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	shoot()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


	
func shoot():
	var instance = projectile.instantiate()
	instance.dir = rotation
	instance.spawnPos = global_position
	instance.spawnRot = rotation
	main.add_child.call_deferred(instance)
	
