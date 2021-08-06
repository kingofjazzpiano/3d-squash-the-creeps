extends Node

export (PackedScene) var mob_scene = preload("res://Mob.tscn")


func _ready():
	randomize()


func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UI/Retry.visible:
		get_tree().reload_current_scene()
		

func _on_Mob_Timer_timeout():
	var mob = mob_scene.instance()
	$Spawn_Path/Spawn_Location.unit_offset = randf()
	add_child(mob)
	mob.initialize($Spawn_Path/Spawn_Location.translation, $Player.transform.origin)
	mob.connect("squashed", $UI/Score_Label, "_on_Mob_squashed")

func _on_Player_hit():
	$Mob_Timer.stop()
	$UI/Retry.show()
