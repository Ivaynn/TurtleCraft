# Executed by any turtle entity
# Tag all entities attached to this turtle

# First search on a small radius (better performance)
tag @s add tc.tmp
execute at @s as @e[distance=..5,type=#tc:turtle_parts,tag=tc.turtle] if score @s tc.id = @e[limit=1,type=#tc:turtle_parts,tag=tc.tmp,tag=tc.turtle] tc.id run tag @s add tc.tmp


# If not enough entities were tagged, search the whole server
execute as @e[type=#tc:turtle_parts,tag=tc.tmp,tag=tc.turtle] run scoreboard players add $entity_count tc.tmp 1
execute unless score $entity_count tc.tmp matches 5.. as @e[type=#tc:turtle_parts,tag=tc.turtle] if score @s tc.id = @e[limit=1,type=#tc:turtle_parts,tag=tc.tmp,tag=tc.turtle] tc.id run tag @s add tc.tmp


# If not enough entities were tagged, this turtle is invalid - remove all entities with this ID
scoreboard players reset $entity_count tc.tmp
execute as @e[type=#tc:turtle_parts,tag=tc.tmp,tag=tc.turtle] run scoreboard players add $entity_count tc.tmp 1
execute unless score $entity_count tc.tmp matches 5.. as @e[type=#tc:turtle_parts,tag=tc.tmp,tag=tc.turtle] run function tc:entity/global_update/invalid_id


# Clear tmp
scoreboard players reset $entity_count tc.tmp
