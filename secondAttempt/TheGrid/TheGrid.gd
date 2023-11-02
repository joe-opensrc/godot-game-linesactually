extends GridContainer
class_name TheGrid

@export var gridSize: int = 3
@export var aBox: PackedScene = preload("res://ABox.tscn")

func _ready():
  self.set_columns(gridSize)
  for i in range(gridSize * gridSize):
    print(i)
    add_child(aBox.instantiate())
    print_tree_pretty()

