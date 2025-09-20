extends Node2D
class_name MatchGrid

signal match_occurred(mana_dict)

@export var rows:int = 7
@export var cols:int = 7
@export var tile_size:int = 64
const COLORS = ["red","blue","green","yellow","purple"]

var grid = [] # 2D array of color strings

func _ready():
    _init_grid()
    $GridRoot.clear()

func _init_grid():
    randomize()
    grid = []
    for r in range(rows):
        grid.append([])
        for c in range(cols):
            var color = COLORS[randi() % COLORS.size()]
            grid[r].append(color)
    _draw_grid()

func _draw_grid():
    var root = $GridRoot
    root.clear()
    for r in range(rows):
        for c in range(cols):
            var spr = Sprite2D.new()
            spr.texture = load("res://assets/sprites/tile_" + grid[r][c] + ".png")
            spr.position = Vector2(c * tile_size, r * tile_size)
            root.add_child(spr)

# Very simple match detection for horizontal only (demo)
func detect_matches():
    var mana = {"red":0,"blue":0,"green":0,"yellow":0,"purple":0}
    # horizontal check
    for r in range(rows):
        var run_color = null
        var run_len = 0
        for c in range(cols):
            var col = grid[r][c]
            if run_color == null or col != run_color:
                if run_len >= 3:
                    # award mana
                    mana[run_color] += run_len
                run_color = col
                run_len = 1
            else:
                run_len += 1
        if run_len >= 3:
            mana[run_color] += run_len
    emit_signal("match_occurred", mana)
    return mana
