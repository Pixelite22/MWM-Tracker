extends Control

@onready var video_stream_player: VideoStreamPlayer = $VideoStreamPlayer
@onready var color_rect: ColorRect = $ColorRect

var video_dict = {
	"Transition" : load("res://Assets/Arts/Other/intro.ogv"), 
	"Split 1" : load("res://Assets/Arts/Other/SPLIT_DECISION_ANIMATION.ogv"), 
	"Split 2" : load("res://Assets/Arts/Other/TWO_VOTE_DIFFERENCE.ogv"), 
	"Split 3" : load("res://Assets/Arts/Other/THREE_VOTE_DIFFERENCE.ogv"), 
	"Split 4" : load("res://Assets/Arts/Other/FOUR_VOTE_DIFFERENCE.ogv"),
	"Split 5" : load("res://Assets/Arts/Other/FIVE_VOTE_DIFFERENCE.ogv")
}

signal transition_hiding

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func video_call(video = "Transition"):
	var tween = create_tween()
	
	await tween.tween_property(color_rect, "color", Color(0.0, 0.0, 0.0), 2.5).finished
	
	video_stream_player.stream = video_dict[video]
	video_stream_player.show()
	video_stream_player.play()
	
	
	await video_stream_player.finished
	
	transition_hiding.emit()
	
	color_rect.color = Color.WHITE
	
	video_stream_player.hide()
	
	tween.kill()
	tween = create_tween()
	await tween.tween_property(color_rect, "color", Color(0.0, 0.0, 0.0, 0.0), .5).finished
	
	tween.kill()
	video_stream_player.stream_position = 0
	#clear_tween.tween_property(video_stream_player, "color", 00000000, .5)
	
