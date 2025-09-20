extends Node
class_name TeamManager

var team = [] # list of hero ids
var data_loader = null

func init(loader):
    data_loader = loader
    # start with 3 default heroes if available
    var ids = data_loader.get_hero_ids()
    for i in range(min(5, ids.size())):
        team.append(ids[i])
