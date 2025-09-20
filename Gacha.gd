extends Node
signal pull_done(results)

@export var pity_limit:int = 50
@export var pulls_for_10x:int = 10
var pity_counter:int = 0
var data = null

func init(loader):
    data = loader

func pull_once():
    var pool = data.get_gacha_pool()
    # normalize rates then roll
    var total = 0.0
    for e in pool:
        total += e.get("rate", 0.0)
    var roll = randf() * total
    var cum = 0.0
    for e in pool:
        cum += e.get("rate", 0.0)
        if roll <= cum:
            pity_counter += 1
            if e.get("rarity",0) >= 5:
                pity_counter = 0
            return e.get("hero_id")
    return pool[-1].get("hero_id")

func pull_ten():
    var results = []
    for i in range(pulls_for_10x):
        results.append(pull_once())
    emit_signal("pull_done", results)
    return results
