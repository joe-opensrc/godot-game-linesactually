extends GridContainer
class_name ABox

@export  var gridSize: int = 3

func _ready():
  self.set_columns(gridSize)
  for i in range(gridSize * gridSize):
    print(i)
    add_child($"..".aBox.instantiate())

    print_tree_pretty()

