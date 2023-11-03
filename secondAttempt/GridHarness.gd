extends Control

@export  var gridSize: int = 3

const aBox: PackedScene = preload("res://secondAttempt/ABox/a_box.tscn")
@export var   openBoxTexture: CompressedTexture2D = preload("res://secondAttempt/ABox/openbox.svg")
@export var closedBoxTexture: CompressedTexture2D = preload("res://secondAttempt/ABox/closedbox.svg")

func _ready():
  %TheGrid.set_columns(gridSize)
  for i in range(gridSize * gridSize):

    var anotherBox = aBox.instantiate()
    anotherBox.set_name("ABox" + str(i))
    anotherBox.set_texture(openBoxTexture)
    anotherBox.get_node("Button").pressed.connect(_on_box_pressed.bind(i))
    %TheGrid.add_child(anotherBox)


func _on_box_pressed(boxIndex):
  print("pressed boxIndex: " + str(boxIndex))
  var tmpBox = %TheGrid.get_child(boxIndex)
  tmpBox.set_flip_v(not tmpBox.is_flipped_v())

