# Executed by tc.body - player has "tc.player" tag


# Reset health
data merge entity @s {Health:1024f,Fire:0s,HurtTime:0s}



# Tag attached entities
function tc:entity/tag_entities


# Check if turtle is busy (other player in a 10 block range has its ID) - if distance is greater than 10 blocks, the original user breaks the link
scoreboard players set $turtle_busy tc.tmp 0
execute at @s as @a[distance=..10,tag=!tc.player] if score @s tc.id = @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] tc.id run scoreboard players set $turtle_busy tc.tmp 1


# Check if turtle is locked and has an owner (if it's not busy)
scoreboard players set $turtle_lock tc.tmp 0
execute if score $turtle_busy tc.tmp matches 0 if score locked_turtles tc.options matches 1 store result score $turtle_lock tc.tmp run data get entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].tag.Instructions[0].Locked 1
execute if score $turtle_busy tc.tmp matches 0 if score locked_turtles tc.options matches 1 unless data entity @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] ArmorItems[0].tag.Owner run scoreboard players set $turtle_lock tc.tmp 0


# If turtle is not busy and is locked, check owner
execute if score $turtle_busy tc.tmp matches 0 if score $turtle_lock tc.tmp matches 1 on attacker if entity @s[tag=tc.player] run function tc:entity/interact/check_owner


# If turtle is busy, show error message
execute if score $turtle_busy tc.tmp matches 1 on attacker run tellraw @s[tag=tc.player] ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"This turtle is being used by another player!\n","color":"gray"}]


# If turtle is not busy and not locked, start interaction
execute if score $turtle_busy tc.tmp matches 0 if score $turtle_lock tc.tmp matches 0 on attacker if entity @s[tag=tc.player] run function tc:entity/interact/as_player


# Update
execute as @e[limit=1,type=minecraft:llama,tag=tc.tmp,tag=tc.body] run function tc:entity/update


# Clear tmp
tag @e[type=#tc:turtle_parts,tag=tc.turtle] remove tc.tmp
scoreboard players reset $turtle_busy tc.tmp
scoreboard players reset $turtle_lock tc.tmp
