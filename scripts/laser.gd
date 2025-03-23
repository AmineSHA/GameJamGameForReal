extends Node2D

@export var beam_length : float = 50
@onready var ray_cast: RayCast2D = $RayCast2D
@onready var beam: Line2D = $BeamLine

var _is_active: bool
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible = false
	_is_active = false
	_set_length(beam_length)
	ray_cast.enabled=false
	ray_cast.target_position.x = beam_length
	pass # Replace with function body.
func is_active(): 
	return _is_active
func _physics_process(delta: float):
	if _is_active:
		_check_laser_hit()

func _check_laser_hit():		
	if ray_cast.is_colliding():
		_set_length(to_local(ray_cast.get_collision_point()).x)
		print(ray_cast.get_collision_point())
	else: 
		_set_length(beam_length) 
	

func _set_length(length: float ):
	beam.points[beam.points.size() - 1].x = length
	
func activate():
	if !_is_active:
		_is_active = true
		ray_cast.enabled = true 
		ray_cast.force_raycast_update()
		_check_laser_hit()
		visible = true
func deactivate():
	if _is_active:
		_is_active= false
		ray_cast.enabled = false
		visible = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
