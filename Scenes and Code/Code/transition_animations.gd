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

#Called when we need a video to play
func video_call(video = "Transition"):
	var tween = create_tween() #create a tween
	
	await tween.tween_property(color_rect, "color", Color(0.0, 0.0, 0.0), 2.0).finished #fade the app to dark
	
	video_stream_player.stream = video_dict[video] #set the video to the correct stream
	video_stream_player.show() #show the video
	video_stream_player.play() #and play it
	
	
	await video_stream_player.finished #wait for the video to finish
	
	transition_hiding.emit() #emit the signal showing the menus are hidden
	
	color_rect.color = Color.WHITE #change the background to white
	
	video_stream_player.hide() #hide the video
	
	tween.kill() #kill the tween from before
	tween = create_tween() #and create a new one
	await tween.tween_property(color_rect, "color", Color(0.0, 0.0, 0.0, 0.0), .5).finished #to fade the color rect out into the new screen
	
	tween.kill() #after the tween finishes, kill it
	video_stream_player.stream_position = 0 #and reset the stream position
	#clear_tween.tween_property(video_stream_player, "color", 00000000, .5)
	
