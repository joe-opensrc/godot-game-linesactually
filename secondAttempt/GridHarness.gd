extends Control

var aBox: PackedScene = preload("res://secondAttempt/ABox/a_box.tscn")
@export var openBoxTexture: CompressedTexture2D = preload("res://secondAttempt/ABox/openbox.svg")
@export  var gridSize: int = 3

func _ready():
  %TheGrid.set_columns(gridSize)
  for i in range(gridSize * gridSize):
    print(i)
    var anotherBox = aBox.instantiate()
    anotherBox.set_name("ABox" + str(i))
    anotherBox.set_texture(openBoxTexture.duplicate(true))
    anotherBox.connect("pressed",_on_box_pressed)
    %TheGrid.add_child(anotherBox)
    print_tree_pretty()

func _on_box_pressed():
  print("woot")
