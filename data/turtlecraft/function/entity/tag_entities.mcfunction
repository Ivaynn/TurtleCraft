# Executed by any turtle entity
# Tag all entities attached to this turtle

# First search on a small radius (better performance)
tag @s add turtlecraft.tmp
execute at @s as @e[distance=..5,type=#turtlecraft:turtle_parts,tag=turtlecraft.turtle] if score @s turtlecraft.id = @e[limit=1,type=#turtlecraft:turtle_parts,tag=turtlecraft.tmp,tag=turtlecraft.turtle] turtlecraft.id run tag @s add turtlecraft.tmp


# If not enough entities were tagged, search the whole server
execute as @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.tmp,tag=turtlecraft.turtle] run scoreboard players add $entity_count turtlecraft.tmp 1
execute unless score $entity_count turtlecraft.tmp matches 5.. as @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.turtle] if score @s turtlecraft.id = @e[limit=1,type=#turtlecraft:turtle_parts,tag=turtlecraft.tmp,tag=turtlecraft.turtle] turtlecraft.id run tag @s add turtlecraft.tmp


# If not enough entities were tagged, this turtle is invalid - remove all entities with this ID
scoreboard players reset $entity_count turtlecraft.tmp
execute as @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.tmp,tag=turtlecraft.turtle] run scoreboard players add $entity_count turtlecraft.tmp 1
execute unless score $entity_count turtlecraft.tmp matches 5.. as @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.tmp,tag=turtlecraft.turtle] run function turtlecraft:entity/global_update/invalid_id


# Clear tmp
scoreboard players reset $entity_count turtlecraft.tmp
return 1
