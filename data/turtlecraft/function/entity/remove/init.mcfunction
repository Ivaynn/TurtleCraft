# Executed by any turtle entity

# Tag all entities of this turtle
function turtlecraft:entity/tag_entities


# Decrement count
execute as @s[tag=turtlecraft.body] run scoreboard players remove $turtle_count turtlecraft.id 1


# Remove ID from player and turtle entities
execute as @a if score @s turtlecraft.id = @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.id run function turtlecraft:reset_player
scoreboard players reset @e[limit=5,type=#turtlecraft:turtle_parts,tag=turtlecraft.tmp,tag=turtlecraft.turtle] turtlecraft.id


# Reset body
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] at @s run function turtlecraft:entity/remove/as_body


# Kill entity + xp drops
execute as @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.tmp,tag=turtlecraft.turtle] at @s run function turtlecraft:entity/remove/void_kill
