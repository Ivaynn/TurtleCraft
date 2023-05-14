# Executed by any turtle entity

# Tag all entities of this turtle
function tc:entity/tag_entities


# Decrement count
execute as @s[tag=tc.body] run scoreboard players remove $turtle_count tc.id 1


# Remove ID from player and turtle entities
execute as @a if score @s tc.id = @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.id run function tc:reset_player
scoreboard players reset @e[limit=5,type=#tc:turtle_parts,tag=tc.tmp,tag=tc.turtle] tc.id


# Reset body
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] at @s run function tc:entity/remove/as_body


# Kill entity + xp drops
execute as @e[type=#tc:turtle_parts,tag=tc.tmp,tag=tc.turtle] at @s run function tc:entity/remove/void_kill
