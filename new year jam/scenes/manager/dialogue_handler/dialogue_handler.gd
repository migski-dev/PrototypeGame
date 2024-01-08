extends Node
# calling it "dialogue handler" since
# dialoguemanager is taken by the plugin

@export var dialogue_res : DialogueResource
@export var title_array : Array[StringName]


func _unhandled_input(event):
	pass
	#if event.is_action_pressed("space"):
		#DialogueManager.show_dialogue_balloon(dialogue_res, title_array.pick_random())

func _ready():
	# receive signal for dialogue
	# now it's randomly triggered with enter in process
	pass


func _process(delta):
	if Input.is_action_just_pressed("enter"):
		print("pressed a")
		trigger_dialogue(title_array.pick_random())

func trigger_dialogue(dialogue):
	DialogueManager.show_dialogue_balloon(dialogue_res, dialogue)
