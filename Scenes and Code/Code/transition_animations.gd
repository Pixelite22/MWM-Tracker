extends Control

@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer
@onready var color_rect: ColorRect = $ColorRect

signal transition_hiding

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func icon_transition():
	var tween = create_tween()
	
	await tween.tween_property(color_rect, "color", Color(0.0, 0.0, 0.0), 2.5).finished
	
	video_stream_player.show()
	video_stream_player.play()
	
	
	await video_stream_player.finished
	
	transition_hiding.emit()
	
	color_rect.color = Color.WHITE
	video_stream_player.hide()
	
	#tween.kill()
	#tween = create_tween()
	#tween.tween_property(color_rect, "color", Color(0.0, 0.0, 0.0, 0.0), 1.0)

	
	#clear_tween.tween_property(video_stream_player, "color", 00000000, .5)
	
