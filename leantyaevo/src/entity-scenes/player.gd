extends CharacterBody2D
#@onready var tiles: TileMapLayer = $"../TileMapLayerMultiplayer"
@onready var tiles: TileMapLayer = $"../TileMapLayerSingleplayer"

signal loop_passed

enum directions { LEFT, UP, RIGHT, DOWN }
var direction_dict = { 0: Vector2.LEFT, 1: Vector2.UP, 2: Vector2.RIGHT, 3: Vector2.DOWN}
var current_direction = directions.LEFT
var loops = 0
var corner_turns = 0

func turn_movement(roll_result: int): 
	for i in range(roll_result): 
		tile_movement(direction_dict[current_direction])
		await get_tree().create_timer(0.5).timeout
	if corner_turns / 4 > 0 && corner_turns % 4 == 0:
		loops += 1 
		loop_passed.emit(loops)
	
func tile_movement(direction: Vector2):
	var target_position
	var current_cell = tiles.local_to_map(tiles.to_local(global_position))
	var target_cell = current_cell+Vector2i(direction)
	
	if tiles.get_cell_source_id(target_cell) != -1:
		target_position = tiles.to_global(tiles.map_to_local(target_cell))
		global_position=target_position
	else:
		current_direction = (current_direction + 1) % 4 
		corner_turns += 1
		tile_movement(direction_dict[current_direction])
