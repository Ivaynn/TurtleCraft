# Executed EVERY TICK if option "global_update" is set to 1

# Tick
scoreboard players add $global_update tc.timer 1


# If ID is invalid, remove turtle
execute if score $global_update tc.timer matches 1 as @e[type=#tc:turtle_parts,tag=tc.turtle] unless score @s tc.id matches 1.. run function tc:entity/global_update/invalid_id


# As every turtle entity
execute as @e[type=#tc:turtle_parts,tag=tc.turtle] if score @s tc.update_id = $global_update tc.timer at @s run function tc:entity/global_update/tag_and_update


# Restart counter
execute if score $global_update tc.timer matches 100.. run scoreboard players set $global_update tc.timer 0
