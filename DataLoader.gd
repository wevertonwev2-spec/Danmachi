extends Node
class_name DataLoader

var heroes = []
var gacha_pool = []

func load_all():
    heroes = []
    gacha_pool = []
    var hfile = "res://data/heroes.json"
    var gfile = "res://data/gacha.json"
    var s = FileAccess.open(hfile, FileAccess.READ)
    var txt = s.get_as_text()
    var j = JSON.parse_string(txt).result
    heroes = j.get("heroes", [])
    var s2 = FileAccess.open(gfile, FileAccess.READ)
    var txt2 = s2.get_as_text()
    var j2 = JSON.parse_string(txt2).result
    gacha_pool = j2.get("gacha_pool", [])
    print("Loaded", heroes.size(), "heroes and gacha pool of", gacha_pool.size())

func get_hero_ids():
    var arr = []
    for h in heroes:
        arr.append(h.get("id"))
    return arr

func get_gacha_pool():
    return gacha_pool

func get_hero_by_id(id):
    for h in heroes:
        if h.get("id") == id:
            return h
    return null
