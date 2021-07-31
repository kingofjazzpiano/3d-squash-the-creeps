extends Node

export (PackedScene) var mob_scene = preload("res://Mob.tscn")

func _on_Mob_Timer_timeout():
	var mob = mob_scene.instance()
	$Spawn_Path/Spawn_Location.unit_offset = randf()
	add_child(mob)
	mob.initialize($Spawn_Path/Spawn_Location.translation, $Player.transform.origin)
