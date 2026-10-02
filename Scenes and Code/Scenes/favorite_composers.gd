extends Label

@onready var song_list: ItemList = $"Song List"

var songs = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func list_em():
	for song in songs:
		song_list.add_item(song)

func _on_mouse_entered() -> void:
	print("Comp mouse entered")
	song_list.position = get_local_mouse_position()
	song_list.show()


func _on_song_list_mouse_exited() -> void:
	song_list.hide()
