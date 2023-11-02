extends Control

var aBox: PackedScene = preload("res://secondAttempt/ABox/a_box.tscn")
@export var openBoxTexture: CompressedTexture2D = preload("res://secondAttempt/ABox/openbox.svg")
@export  var gridSize: int = 3

func _ready():
  %TheGrid.set_columns(gridSize)
  for i in range(gridSize * gridSize):
#    print(i)
    var anotherBox = aBox.instantiate()
    anotherBox.set_name("ABox" + str(i))
    anotherBox.set_texture(openBoxTexture.duplicate(true))
    anotherBox.get_node("Button").pressed.connect(_on_box_pressed.bind(i))
    %TheGrid.add_child(anotherBox)


func _on_box_pressed(boxIndex):
  print("pressed boxIndex: " + str(boxIndex))
  var aBox = $TheGrid.get_child(boxIndex)
  aBox.set_flip_v(not aBox.is_flipped_v())

