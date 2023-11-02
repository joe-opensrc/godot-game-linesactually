extends TextureRect
class_name ABox

var openFace: CompressedTexture2D = preload("res://secondAttempt/ABox/icon.svg")

func _ready():
  openFace.set_local_to_scene(true)

  var thisFace = openFace.duplicate(true)
  thisFace.set_local_to_scene(true)
  openFace.queue_free()

  self.set_texture(thisFace)
