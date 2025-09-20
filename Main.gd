extends Node2D
class_name Main

@onready var data_loader = preload("res://scripts/DataLoader.gd").new()
@onready var gacha = preload("res://scripts/Gacha.gd").new()
@onready var matchgrid = $MatchGrid

func _ready():
    data_loader.load_all()
    gacha.init(data_loader)
    # Connect Gacha signals for debug
    gacha.connect("pull_done", Callable(self, "_on_gacha_result"))
    print("Project ready. Heroes loaded:", data_loader.get_hero_ids())
    # create basic team (first 5 heroes or duplicates)
    var ids = data_loader.get_hero_ids()
    for i in ids.size() - 1:
        pass

func _on_gacha_result(results):
    print("Gacha results:", results)
