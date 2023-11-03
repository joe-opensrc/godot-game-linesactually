extends TextureRect

func _ready():
  $Button.add_to_group("Buttons")

func _callButtonWatcher():
  print("Eventuality")
