extends Node
# calling it "dialogue handler" since
# dialoguemanager is taken by the plugin

@export var dialogue_res : DialogueResource
@export var title_array : Array[StringName]
@export_range(0, 1.0) var dialogue_chance : float = 0.5

func _unhandled_input(event):
	pass
	#if event.is_action_pressed("space"):
		#DialogueManager.show_dialogue_balloon(dialogue_res, title_array.pick_random())

func _ready():
	randomize() # for better rand
	# receive signal for dialogue
	# now it has a chance to be randomly triggered on enter
	pass


func _process(delta):
	if Input.is_action_just_pressed("enter"):
		var rand = randf()
		print(str(rand))
		if rand < dialogue_chance:
			trigger_dialogue(title_array.pick_random())

func trigger_dialogue(dialogue):
	DialogueManager.show_dialogue_balloon(dialogue_res, dialogue)
