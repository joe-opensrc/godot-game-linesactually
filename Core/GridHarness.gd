extends Control

@export var        noOfCols: int = 2
@export var        noOfRows: int = 2
@export var    memGroupSize: int = 2
var         totalNumOfCards: int
var          minNumOfTextures: float

@export var h_sep: int = 4
@export var v_sep: int = 4

const aBox: PackedScene = preload("res://Core/ABox/a_box.tscn")
@export var   openBoxTexture: CompressedTexture2D = preload("res://Core/ABox/openbox.svg")
@export var closedBoxTexture: CompressedTexture2D = preload("res://Core/ABox/closedbox.svg")


func _init():
  pass


func _ready():

  print(noOfRows, ", ", noOfCols)
  totalNumOfCards = noOfRows * noOfCols
  minNumOfTextures = totalNumOfCards / float(memGroupSize)

  assert( fmod( minNumOfTextures, (1.0*totalNumOfCards / memGroupSize) ) == 0.0 )
  assert(memGroupSize > 1)
  assert(minNumOfTextures > 1 && minNumOfTextures != totalNumOfCards)

  %TheGrid.set_columns(noOfCols)

  %TheGrid.add_theme_constant_override("h_separation",h_sep)
  %TheGrid.add_theme_constant_override("v_separation",v_sep)

  print( %TheGrid.get_theme_constant("h_separation") )
  print( %TheGrid.get_theme_constant("v_separation") )

  var anotherBox: Object
  for i in range(totalNumOfCards):
    anotherBox = aBox.instantiate()
    anotherBox.set_name("ABox" + str(i))
    anotherBox.set_texture(closedBoxTexture)
    anotherBox.get_node("Button").pressed.connect(_on_box_pressed.bind(i))
    %TheGrid.add_child(anotherBox)


func _on_box_pressed(boxIndex):
  print("pressed boxIndex: " + str(boxIndex))
  _flipBox(boxIndex)

func _flipBox(boxIndex):
  var tmpBox = %TheGrid.get_child(boxIndex)
  tmpBox.set_flip_v(not tmpBox.is_flipped_v())

