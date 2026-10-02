extends Control

@export_category("State Logic")
enum load_states {FIGHT, RUN, DANCE}#, DANCEN}

@export var curr_state : load_states
@onready var message: Label = $Message

@export_category("Sprite Info")
@export var sprite_info = {
	#"Sprite Name" : [Node Scale, Sprite FPS]
	"Dance Anime" : [Vector2(0.75, 0.75), 3.0], 
	"Dance Baba" : [Vector2(0.75, 0.75), 5.0],
	"Dance Darkie" : [Vector2(0.75, 0.75), 10.0],
	"Dance Eric1" : [Vector2(0.75, 0.75), 5.0],
	"Dance Eric2" : [Vector2(0.75, 0.75), 3.0],
	"Dance Fatman" : [Vector2(0.75, 0.75), 3.0],
	"Dance Freakshow" : [Vector2(0.75, 0.75), 10.0],
	"Dance Rick1" : [Vector2(0.75, 0.75), 5.0],
	"Dance Rick2" : [Vector2(0.75, 0.75), 3.0],
	"Fight Bill" : [Vector2(0.4, 0.4), 2.0],
	"Fight Ruler" : [Vector2(0.4, 0.4), 2.0],
	"Run Cici" : [Vector2(0.5, 0.5), 20.0],
	"Run Farquad" : [Vector2(0.5, 0.5), 5.0],
	"Run Kyoko" : [Vector2(1.0, 1.0), 5.0],
	"Run Misako" : [Vector2(1.0, 1.0), 5.0]
}

var frames = "res://Assets/Sprite Frames/Loading Sprites.tres"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func loading_message():
	var ctr = 0
	while is_visible_in_tree():
		await get_tree().create_timer(0.5).timeout
		if ctr >= 3:
			message.text = message.text.substr(0, "Loading your playlist".length())
			ctr = 0
			continue
		message.text += "."
		ctr += 1


func load_screen():
	loading_message()
	for child in get_children():
		if not child is Label:
			child.queue_free()
	
	match curr_state:
		load_states.DANCE:
			var i = 0
			var sprite_active : Array = []
			while i < 4:
				var poss_sprite : String = sprite_info.keys().pick_random()
				if poss_sprite.begins_with("Dance") and not (poss_sprite in sprite_active):
					var sprite_call = create_sprite(poss_sprite)
					sprite_active.append(poss_sprite)
					match i:
						0:
							sprite_call.position = Vector2(168, 306)
						1:
							sprite_call.position = Vector2(512, 306)
						2:
							sprite_call.position = Vector2(168, 970)
						3:
							sprite_call.position = Vector2(512, 970)
					sprite_call.play()
					i += 1
				else:
					continue
		
		
		load_states.FIGHT:
			#print("Start a fight")
			var sprite1 = create_sprite("Fight Bill")
			var sprite2 = create_sprite("Fight Ruler")
			
			sprite1.position = Vector2(168, 305)
			sprite2.position = Vector2(512, 305)
			
			sprite1.play()
			sprite2.play()
		
		
		load_states.RUN:
			var sprite1 = create_sprite("Run Cici")
			var sprite2 = create_sprite("Run Farquad")
			var sprite3 = create_sprite("Run Kyoko")
			var sprite4 = create_sprite("Run Misako")
			
			sprite1.position = Vector2(352, 298)
			sprite2.position = Vector2(608, 1122)
			sprite3.position = Vector2(128, 1122)
			sprite4.position = Vector2(288, 1122)
			
			sprite1.play()
			sprite2.play()
			sprite3.play()
			sprite4.play()
		
#		load_states.DANCEN:
#			pass

func create_sprite(sprite : String):
	var sprite_inst = AnimatedSprite2D.new()
	
	sprite_inst.sprite_frames = load(frames)
	sprite_inst.animation = sprite
	sprite_inst.scale = sprite_info[sprite_inst.animation][0]
	sprite_inst.sprite_frames.set_animation_speed(sprite, sprite_info[sprite_inst.animation][1])
	
	add_child(sprite_inst)
	
	return sprite_inst
