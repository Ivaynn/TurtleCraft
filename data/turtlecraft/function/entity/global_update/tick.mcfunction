# Executed EVERY TICK if option "global_update" is set to 1

# Tick
scoreboard players add $global_update turtlecraft.timer 1


# If ID is invalid, remove turtle
execute if score $global_update turtlecraft.timer matches 1 as @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.turtle] unless score @s turtlecraft.id matches 1.. run function turtlecraft:entity/global_update/invalid_id


# As every turtle entity
execute as @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.turtle] if score @s turtlecraft.update_id = $global_update turtlecraft.timer at @s run function turtlecraft:entity/global_update/tag_and_update


# Restart counter
execute if score $global_update turtlecraft.timer matches 100.. run scoreboard players set $global_update turtlecraft.timer 0
