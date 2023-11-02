extends Control


var aBox: PackedScene = preload("res://secondAttempt/ABox/a_box.tscn")
@export var openboxTex: CompressedTexture2D = preload("res://secondAttempt/ABox/icon.svg")
@export  var gridSize: int = 3

func _ready():
  %TheGrid.set_columns(gridSize)
  for i in range(gridSize * gridSize):
    print(i)
    var anotherBox = aBox.instantiate()
    %TheGrid.add_child(anotherBox)
    print_tree_pretty()
