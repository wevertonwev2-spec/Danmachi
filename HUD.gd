extends CanvasLayer
@onready var gacha_button = $GachaButton
@onready var team_panel = $TeamPanel

func _ready():
    gacha_button.pressed.connect(_on_gacha_pressed)
    # draw some placeholder hero cards
    for i in range(5):
        var lbl = Label.new()
        lbl.text = "Hero " + str(i+1)
        team_panel.add_child(lbl)

func _on_gacha_pressed():
    # open gacha scene as popup (for simplicity, instantiate and call pull)
    var gacha_scene = load("res://scenes/Gacha.tscn").instantiate()
    add_child(gacha_scene)
    var gacha_node = gacha_scene.get_node(".")
    # connect to its script
    var gacha_script = preload("res://scripts/Gacha.gd").new()
    gacha_script.init(get_node("/root/Main").data_loader if has_node("/root/Main") else null)
    gacha_script.connect("pull_done", Callable(self, "_gacha_results"))
    # simulate pull ten
    var res = gacha_script.pull_ten()
    _gacha_results(res)

func _gacha_results(results):
    var popup = Label.new()
    popup.text = "Gacha: " + str(results)
    popup.position = Vector2(520, 320)
    add_child(popup)
