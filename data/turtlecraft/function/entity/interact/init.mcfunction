# Executed by turtlecraft.body - player has "turtlecraft.player" tag


# Reset nbt
data merge entity @s {Health:1024f,Fire:-1s,HurtTime:0s}



# Tag attached entities
function turtlecraft:entity/tag_entities


# Check if turtle is busy (other player in a 10 block range has its ID) - if distance is greater than 10 blocks, the original user breaks the link
scoreboard players set $turtle_busy turtlecraft.tmp 0
execute at @s as @a[distance=..10,tag=!turtlecraft.player] if score @s turtlecraft.id = @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] turtlecraft.id run scoreboard players set $turtle_busy turtlecraft.tmp 1


# Check if turtle is locked and has an owner (if it's not busy)
scoreboard players set $turtle_lock turtlecraft.tmp 0
execute if score $turtle_busy turtlecraft.tmp matches 0 if score locked_turtles turtlecraft.options matches 1 store result score $turtle_lock turtlecraft.tmp run data get entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.feet.components."minecraft:custom_data".turtlecraft.Instructions[0].Locked 1
execute if score $turtle_busy turtlecraft.tmp matches 0 if score locked_turtles turtlecraft.options matches 1 unless data entity @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] equipment.feet.components."minecraft:custom_data".turtlecraft.Owner run scoreboard players set $turtle_lock turtlecraft.tmp 0


# If turtle is not busy and is locked, check owner
execute if score $turtle_busy turtlecraft.tmp matches 0 if score $turtle_lock turtlecraft.tmp matches 1 on attacker if entity @s[tag=turtlecraft.player] run function turtlecraft:entity/interact/check_owner


# If turtle is busy, show error message
execute if score $turtle_busy turtlecraft.tmp matches 1 on attacker run tellraw @s[tag=turtlecraft.player] ["",{"text":"\n> ","bold":true,"color":"red"},{"text":"This turtle is being used by another player!\n","color":"gray"}]


# If turtle is not busy and not locked, start interaction
execute if score $turtle_busy turtlecraft.tmp matches 0 if score $turtle_lock turtlecraft.tmp matches 0 on attacker if entity @s[tag=turtlecraft.player] run function turtlecraft:entity/interact/as_player


# Update
execute as @e[limit=1,type=minecraft:llama,tag=turtlecraft.tmp,tag=turtlecraft.body] run function turtlecraft:entity/update


# Clear tmp
tag @e[type=#turtlecraft:turtle_parts,tag=turtlecraft.turtle] remove turtlecraft.tmp
scoreboard players reset $turtle_busy turtlecraft.tmp
scoreboard players reset $turtle_lock turtlecraft.tmp
