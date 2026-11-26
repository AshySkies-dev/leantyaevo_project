extends CharacterBody2D
@onready var tiles: TileMapLayer = $"../TileMapLayer"


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("left"):
		tile_movement(Vector2.LEFT)
	elif Input.is_action_just_pressed("right"):
		tile_movement(Vector2.RIGHT)
	elif Input.is_action_just_pressed("up"):
		tile_movement(Vector2.UP)
	elif Input.is_action_just_pressed("down"):
		tile_movement(Vector2.DOWN)

	
func tile_movement(direction: Vector2):
	var current_cell = tiles.local_to_map(tiles.to_local(global_position))
	var target_cell = current_cell+Vector2i(direction)
	if tiles.get_cell_source_id(target_cell) != -1:
		var target_position = tiles.to_global(tiles.map_to_local(target_cell))
		global_position=target_position
